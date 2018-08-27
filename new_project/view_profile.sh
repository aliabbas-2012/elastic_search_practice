POST trending/doc/_search
{
  "_source": ["id","name"], 
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "box"
          }
        },
        {
          "term": {
            "user_id": "u-5"
          }
        },
        {
          "terms":{
            "status":["F","A"]
          }
        }
      ]
    }
  },
  "aggs": {
    "boxes": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "top_tags": {
          "terms": {
            "field": "box_posts.box_id",
            "size": 3,
            "order": {
              "created_at_order": "desc"
            }
          },
          "aggs": {
            "top_sales_hits": {
              "top_hits": {
                "sort": [
                  {
                    "box_posts.created_at": {
                      "order": "desc"
                    }
                  }
                ],
                "_source": {
                  "includes": [
                    "box_posts.id",
                    "box_posts.box_id",
                    "box_posts.created_at",
                    "box_posts.post_media.file"
                  ]
                },
                "size": 4
              }
            },
            "created_at_order": {
              "max": {
                "field": "box_posts.created_at"
              }
            }
          }
        }
      }
    }
  }
}


curl -XGET -H 'Content-Type: application/json'  'http://172.31.26.71:9200/trending/doc/_search?pretty' -d '
{
  "size": 0,
  "_source": false,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "box"
          }
        },
        {
          "term": {
            "user_id": "u-9587"
          }
        },
        {
          "terms": {
            "status": [
              "A",
              "F"
            ]
          }
        }
      ]
    }
  },
  "aggs": {
    "boxes": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "top_boxes": {
          "terms": {
            "field": "box_posts.box_id",
            "size": 2,
            "order": {
              "created_at_order": "desc"
            }
          },
          "aggs": {
            "top_posts": {
              "top_hits": {
                "sort": [
                  {
                    "box_posts.created_at": {
                      "order": "desc"
                    }
                  }
                ],
                "_source": {
                  "includes": [
                    "name",
                    "box_posts.id",
                    "box_posts.box_id",
                    "box_posts.created_at",
                    "box_posts.post_media.file",
                    "box_posts.post_media.file_type_number"
                  ]
                },
                "size": 4
              }
            },
            "created_at_order": {
              "max": {
                "field": "box_posts.created_at"
              }
            }
          }
        }
      }
    }
  }
}
'


