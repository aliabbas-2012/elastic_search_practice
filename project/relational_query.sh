# start from users
GET trending/doc/_search
{
  "_source": [
    "id",
    "username"
  ],
  "query": {
    "bool": {
      "must": [
        {
          "has_child": {
            "type": "followings",
            "query": {
              "bool": {
                "must_not": [
                  {
                    "term": {
                      "user_id": "u_5"
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
                "must_not": [
                  {
                    "term": {
                      "user_id": "u_5"
                    }
                  }
                ]
              }
            }
          }
        },
        {
          "has_child": {
            "type": "post",
            "query": {
              "bool": {
                "must_not": [
                  {
                    "term": {
                      "user_id": "u_5"
                    }
                  }
                ],
                "must": [
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
                            }
                          ],
                          "must_not": [
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
            "inner_hits": {
              "size": 1,
              "sort": [
                {
                  "_geo_distance": {
                    "location": [
                      74,
                      31
                    ],
                    "order": "asc",
                    "unit": "km"
                  }
                },
                {
                  "created_at": "desc"
                }
              ],
              "_source": [
                "id",
                "text_content",
                "location",
                "created_at"
              ]
            }
          }
        },
        {
          "term": {
            "type": "user"
          }
        },
        {
          "term": {
            "is_live": true
          }
        }
      ],
      "must_not": [
        {
          "term": {
            "id": "u_5"
          }
        }
      ]
    }
  }
}

# start from posts
GET trending/doc/_search
{
  "_source": [
    "id",
    "text_content",
    "user_id"
  ],
  "query": {
    "bool": {
      "must": [
        {
          "has_parent": {
            "parent_type": "user",
            "inner_hits": {
              "_source": [
                "username",
                "is_live"
              ]
            },
            "query": {
              "term": {
                "is_live": true
              }
            }
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
                "must":[
                   {
                    "term": {
                      "user_id": 5
                    }
                  }
                ],
                "must_not": [
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
  }
}
