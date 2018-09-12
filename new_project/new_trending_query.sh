GET /trending/doc/_search
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
            "status": "A"
          }
        },
        {
          "nested": {
            "path": "box_user",
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "box_user.is_private": false
                    }
                  }
                ]
              }
            }
          }
        },
        {
          "nested": {
            "path": "box_posts",
            "query": {
              "bool": {
                "must": [
                  {
                    "exists": {
                      "field": "box_posts.created_location"
                    }
                  }
                ]
              }
            }
          }
        }
      ],
      "must_not":[
        {
         "terms":{
            "user_id" :["u-19712"]
         }
        }
      ]
    }
  },
  "aggs": {
    "posts": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "filterd": {
          "filter": {
            "bool": {
              "must": [
                
              ],
              "must_not": [
                {
                  "terms":{
                    "box_posts.id":[3956099]
                  }
                }
              ]
            }
          },
          "aggs": {
            "top_users": {
              "terms": {
                "size": 200,
                "order": {
                  "nearest": "asc",
                  "latest": "desc"
                },
                "field": "box_posts.user_id"
              },
              "aggs": {
                "top_post": {
                  "terms": {
                    "size": 1,
                    "field": "box_posts.id",
                    "order": {
                      "sort_order_id": "desc"
                    }
                  },
                  "aggs": {
                    "sort_order_id": {
                      "min": {
                        "field": "box_posts.id"
                      }
                    }
                  }
                },
                "latest": {
                  "max": {
                    "field": "box_posts.created_at"
                  }
                },
                "nearest": {
                  "min": {
                    "script": {
                      "source": "return doc['box_posts.created_location'].planeDistance(params.lat,params.lon)",
                      "params": {
                        "lon": 74,
                        "lat": 31
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}