curl -XDELETE -H 'Content-Type: application/json'  'http://localhost:9200/profile-boxes-cache'
curl -XPUT "http://localhost:9200/profile-boxes-cache" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "max_result_window": 5000000,
      "analysis": {
        "filter": {
          "autocomplete_filter": {
            "type": "edge_ngram",
            "min_gram": 1,
            "max_gram": 20
          }
        },
        "analyzer": {
          "autocomplete": {
            "type": "custom",
            "tokenizer": "standard",
            "filter": [
              "lowercase",
              "autocomplete_filter"
            ]
          },
          "edge_ngram_analyzer": {
            "filter": [
              "lowercase"
            ],
            "tokenizer": "edge_ngram_tokenizer"
          },
          "edge_ngram_search_analyzer": {
            "tokenizer": "lowercase"
          }
        },
        "tokenizer": {
          "edge_ngram_tokenizer": {
            "type": "edge_ngram",
            "min_gram": 1,
            "max_gram": 20,
            "token_chars": [
              "letter",
              "digit"
            ]
          }
        }
      }
    }
  },
  "mappings": {
    "doc": {
      "properties": {
        "id": {
          "type": "integer",
          "index": true
        },
        "user_id": {
          "type": "integer",
          "index": true
        },
        "name": {
          "type": "text",
          "index": true,
          "analyzer": "autocomplete",
          "search_analyzer": "standard",
          "fielddata": true,
          "fields": {
            "edgengram": {
              "type": "text",
              "analyzer": "edge_ngram_analyzer",
              "search_analyzer": "edge_ngram_search_analyzer"
            },
            "raw": {
              "type": "keyword",
              "index": true
            }
          }
        },
        "post_count": {
          "type": "integer",
          "index": true
        },
        "is_update": {
          "type": "boolean"
        },
        "status": {
          "type": "keyword",
          "index": true
        },
        "indexed_at": {
          "type": "date",
          "fields": {
            "raw": {
              "type": "keyword",
              "index": false
            }
          }
        }
      }
    }
  }
}
'