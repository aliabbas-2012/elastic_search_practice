curl -XDELETE -H 'Content-Type: application/json'  'https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/profile-boxes-cache'
curl -XPUT "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/profile-boxes-cache" -H 'Content-Type: application/json' -d'
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