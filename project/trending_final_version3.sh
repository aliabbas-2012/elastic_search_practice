GET trending/doc/_search
{
  "size": 0,
  "_source": false,
  "query": {
    "bool": {
      "must": [
        {
          "term":{
            "type":"post"
          }
        },
        {
          "has_parent": {
            "parent_type": "user",
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "is_live": true
                    }
                  }
                ],
                "must_not": [
                  {
                    "has_child": {
                      "type": "followers",
                      "query": {
                        "bool": {
                          "must": [
                            {
                              "terms": {
                                "user_id": [
                                  "u_5"
                                ]
                              }
                            }
                          ]
                        }
                      }
                    }
                  },
                  {
                    "has_child": {
                      "type": "block",
                      "query": {
                        "bool": {
                          "must": [
                            {
                              "term": {
                                "blocked_user_id": "u_5"
                              }
                            }
                          ]
                        }
                      }
                    }
                  },
                  {
                    "has_child": {
                      "type": "blocked",
                      "query": {
                        "bool": {
                          "must": [
                            {
                              "term": {
                                "user_id": "u_5"
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
        }
      ],
      "must_not": [
        {
          "term": {
            "user_id": "u_5"
          }
        },
        {
          "has_child": {
            "type": "views",
            "inner_hits": {
              "_source": [
                "created_at",
                "object_id",
                "id"
              ]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "user_id": "u_5"
                    }
                  },
                  {
                    "range": {
                      "created_at": {
                        "lte": "now",
                        "gte": "now-15d/d"
                      }
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
  "sort": [
    {
      "_geo_distance": {
        "location": [
          74.34,
          31.54
        ],
        "order": "asc",
        "unit": "km"
      }
    },
    {
      "created_at": "desc"
    }
  ],
  "aggs": {
    "top_users": {
      "terms": {
        "field": "user_id",
  
        "size":300,
        "order": {
          "location_order": "asc",
          "created_at_order":"desc"
        }
      },
      "aggs": {
        "top_post_hits": {
          "top_hits": {
            "sort": [
              {
                "created_at":"desc"
              }
            ],
            "_source": {
              "includes": [
                "id"
              ]
            },
            "size": 1
          }
        },
        "location_order": {
          "min": {
            "script": {
              "source": "return doc['location'].planeDistance(params.lat,params.lon)",
              "params": {
                "lon": 74.34,
                "lat": 31.54
              }
            }
          }
        },
        "created_at_order": {
          "min": {
            "script": {
              "source": "return doc['created_at']"
            }
          }
        }
      }
    }
  }
}