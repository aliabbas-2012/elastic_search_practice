curl -XDELETE -H 'Content-Type: application/json'  'http://localhost:9200/users'
curl -X PUT "localhost:9200/users" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "max_result_window": 5000000
    },
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
    "user": {
      "properties": {
        "id": {
          "type": "integer"
        },
        "email": {
          "type": "text",
          "index": true
        },
        "phone": {
          "type": "text",
          "index": true,
          "fields": {
            "raw": {
              "type": "keyword",
              "index": false
            }
          }
        },
        "uid": {
          "type": "keyword",
          "index": true
        },
        "facebook_id": {
          "type": "keyword",
          "index": true
        },
        "username": {
          "type": "text",
          "analyzer": "autocomplete",
          "fields": {
            "raw": {
              "type": "keyword",
              "index": false
            }
          }
        },
        "full_name": {
          "type": "text",
          "analyzer": "autocomplete",
          "fields": {
            "raw": {
              "type": "keyword",
              "index": false
            }
          }
        },
        "picture": {
          "type": "text",
          "index": true
        },
        "gender": {
          "type": "keyword",
          "index": true
        },
        "is_live": {
          "type": "boolean",
          "index": true
        },
        "message_privacy": {
          "type": "integer",
          "index": true
        },
        "location": {
          "type": "geo_point"
        },
        "score": {
          "type": "integer",
          "index": false
        },
        "login_country_name": {
          "type": "keyword",
          "index": true
        },
        "boxes": {
          "type": "nested",
          "properties": {
            "id": {
              "type": "integer",
              "index": true
            },
            "name": {
              "type": "text",
              "index": true,
              "fields": {
                "raw": {
                  "type": "keyword",
                  "index": false
                }
              }
            },
            "status": {
              "type": "keyword",
              "index": true
            },
            "post_count": {
              "type": "integer",
              "index": true
            }
          }
        },
        "followers": {
          "type": "nested",
          "properties": {
            "id": {
              "type": "integer",
              "index": true
            },
            "follower_id": {
              "type": "integer",
              "index": true
            },
            "status": {
              "type": "keyword",
              "index": true
            }
          }
        },
        "my_block_list": {
          "type": "text",
          "index": true
        },
        "blocked_me_list": {
          "type": "text",
          "index": true
        },
        "created_at": {
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
