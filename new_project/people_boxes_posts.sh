# Related to people screen

POST /trending/_cache/clear
POST trending/doc/_search
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
          "bool": {
            "should": [
              {
                "bool": {
                  "must": [
                    {
                      "terms": {
                        "user_id": ["u-5"]
                      }
                    },
                    {
                      "terms": {
                        "status": [
                          "F",
                          "A"
                        ]
                      }
                    }
                  ]
                }
              },
              {
                "bool": {
                  "must": [
                    {
                      "terms": {
                        "user_id": ["u-18368"]
                      }
                    },
                    {
                      "terms": {
                        "status": [
                          "A"
                        ]
                      }
                    }
                  ]
                }
              }
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
            "size": 4,
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

# other version
POST trending/doc/_search
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
          "bool": {
            "should": [
              {
                "bool": {
                  "must": [
                    {
                      "terms": {
                        "user_id": [
                          "u-19071",
                          "u-18368",
                          "u-14"
                        ]
                      }
                    },
                    {
                      "terms": {
                        "status": [
                          "F",
                          "A"
                        ]
                      }
                    }
                  ]
                }
              },
              {
                "bool": {
                  "must": [
                    {
                      "terms": {
                        "user_id": [
                          "u-28910",
                          "u-29034",
                          "u-17118",
                          "u-125",
                          "u-23216",
                          "u-20147",
                          "u-21633",
                          "u-28447",
                          "u-20109",
                          "u-20981",
                          "u-22630",
                          "u-22597",
                          "u-23225",
                          "u-20234",
                          "u-20267",
                          "u-27451",
                          "u-29033",
                          "u-25742",
                          "u-26270",
                          "u-25403",
                          "u-19060",
                          "u-28658",
                          "u-28671",
                          "u-20212",
                          "u-20572",
                          "u-20727",
                          "u-20905",
                          "u-9565",
                          "u-13538",
                          "u-3039",
                          "u-3312",
                          "u-2019",
                          "u-21743",
                          "u-29047",
                          "u-17882",
                          "u-9120",
                          "u-24782"
                        ]
                      }
                    },
                    {
                      "term": {
                        "status": "A"
                      }
                    }
                  ]
                }
              }
            ]
          }
        }
      ]
    }
  },
  "aggs": {
    "users": {
      "terms": {
        "field": "user_id",
        "size": 40
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
                "size": 4,
                "order": {
                  "created_at_order": "desc"
                }
              },
              "aggs": {
               
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
  }
}