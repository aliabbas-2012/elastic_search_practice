GET /trending/doc/_search
{
  "size": 1,
  "query": {
    "bool": {
      "should": [
        {
          "bool": {
            "must": [
              {
                "term": {
                  "type": "post"
                }
              },
              {
                "term": {
                  "id": "p-125051"
                }
              }
            ]
          }
        },
        {
          "has_child": {
            "type": "likes",
            "inner_hits": {
              "size": 1,
              "_source":["id","user_id","object_id"]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "term":{
                      "user_id":"u-18368"
                    }
                  }  
                ]
              }
            }
          }
        }
      ]
    }
  }
}


GET /trending/doc/_search
{
  "size": 1,
  "query": {
    "bool": {
      "should": [
        {
          "bool": {
            "must": [
              {
                "term": {
                  "type": "post"
                }
              },
              {
                "term": {
                  "id": "p-125051"
                }
              }
            ]
          }
        },
        {
          "has_child": {
            "type": "likes",
            "inner_hits": {
              "size": 1,
              "_source": [
                "id",
                "user_id",
                "object_id"
              ]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "user_id": "u-18368"
                    }
                  }
                ]
              }
            }
          }
        }
      ]
    }
  },
  "aggs": {
    "to-answers": {
      "children": {
        "type": "likes"
      },
      "aggs": {
        "top-names": {
          "terms": {
            "field": "object_id",
            "size": 1
          }
        }
      }
    }
  }
}


#-------------Trending Query-------------------#
POST trending/doc/_search
{
  "_source": false,
  "size": 0,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "post"
          }
        },
        {
          "has_parent": {
            "parent_type": "user",
            "query": {
              "bool": {
                "must": {
                  "parent_id": {
                    "type": "followings",
                    "id": "u-107"
                  }
                }
              }
            }
          }
        }
      ]
    }
  },
  "sort": [
    {
      "db_id": {
        "order": "desc"
      }
    }
  ],
  "aggs": {
    "top-tags": {
      "terms": {
        "field": "id",
        "size": 10,
        "order": {
          "created_at_order": "desc"
        }
      },
      "aggs": {
        "likes_count": {
          "children": {
            "type": "likes"
          }
        },
        "liked_by_me": {
          "children": {
            "type": "likes"
          },
          "aggs": {
            "query": {
              "filter": {
                "term": {
                  "user_id": "u-18368"
                }
              }
            }
          }
        },
        "created_at_order": {
          "min": {
            "field": "created_at"
          }
        }
      }
    }
  }
}