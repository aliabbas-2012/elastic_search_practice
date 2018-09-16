delete fayvo_test
PUT fayvo_test
{
  "settings": {
    "number_of_shards": 3,
    "number_of_replicas": 2,
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
        }
      }
    }
  },
  "mappings": {
    "doc": {
      "properties": {
        "id": {
          "type": "long",
          "index": true
        },
        "uid": {
          "type": "keyword",
          "index": true
        },
        "subject_id": {
          "type": "keyword",
          "index": true
        },
        "object_id": {
          "type": "keyword",
          "index": true
        },
        "name": {
          "type": "text",
          "index": true,
          "analyzer": "autocomplete",
          "fields": {
            "raw": {
              "type": "keyword",
              "index": false
            }
          }
        },
        "content": {
          "type": "text",
          "index": true,
          "analyzer": "autocomplete",
          "fields": {
            "raw": {
              "type": "keyword",
              "index": false
            }
          }
        },
        "is_live": {
          "type": "boolean",
          "index": true
        },
        "status": {
          "type": "keyword",
          "index": true
        },
        "score": {
          "type": "long",
          "index": true
        },
        "created_at": {
          "type": "date",
          "index": true
        },
        "updated_at": {
          "type": "date",
          "index": true
        },
        "check_in": {
          "type": "geo_point",
          "index": true
        },
        "place": {
          "dynamic": false,
          "properties": {
            "name": {
              "type": "text",
              "index": true
            },
            "city": {
              "type": "text",
              "index": true
            },
            "id": {
              "type": "keyword",
              "index": true
            }
          }
        },
        "media": {
          "dynamic": true,
          "properties": {
           
          }
        },
        "created_location": {
          "type": "geo_point",
          "index": true
        },
        "type": {
          "type": "join",
          "relations": {
            "user": [
              "posts",
              "boxes",
              "followings",
              "followers",
              "my_blocked",
              "blocked_me"
            ],
            "posts": [
              "views",
              "likes",
              "comments"
            ],
            "boxes": [
              "boxes_posts"
            ]
          }
        }
      }
    }
  }
}