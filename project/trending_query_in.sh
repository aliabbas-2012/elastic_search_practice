GET trending/doc/_search
{
  "query": {
    "bool": {
      "must": {
        "term": {
          "type": "followers"
        }
      }
    }
  }
}
GET trending/doc/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "followers"
          }
        },
        {
          "parent_id": {
            "type": "followers",
            "id": "u_28665"
          }
        }
      ]
    }
  }
}
GET trending/doc/_count
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "followings"
          }
        },
        {
          "parent_id": {
            "type": "followings",
            "id": "u_28665"
          }
        }
      ]
    }
  }
}
GET trending/doc/_search
{
  "_source": [
    "id",
    "text_content",
    "user_id",
    "created_at",
    "location"
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
              "bool": {
                "must": [
                  {
                    "term": {
                      "is_live": true
                    }
                  },
                  {
                    "has_child": {
                      "type": "followers",
                      "inner_hits": {
                        "_source": [
                          "created_at",
                          "object_id",
                          "id"
                        ]
                      },
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
                      "type": "block",
                      "inner_hits": {
                        "_source": [
                          "created_at",
                          "object_id",
                          "id"
                        ]
                      },
                      "query": {
                        "bool": {
                          "must_not": [
                            {
                              "term": {
                                "blocked_user_Id": "u_5"
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
                      "inner_hits": {
                        "_source": [
                          "created_at",
                          "object_id",
                          "id"
                        ]
                      },
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
                  }
                ]
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
      ],
      "must_not": [
        {
          "term": {
            "user_id": "u_5"
          }
        }
      ]
    }
  },
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
  ]
}








GET trending/doc/_search
{
  "query": {
    "bool": {
      "must": {
        "term": {
          "type": "followers"
        }
      }
    }
  }
}
GET trending/doc/_count
{
  "query": {
    "bool": {
      "must": [
        {
          "parent_id": {
            "type": "followers",
            "id": "u_5"
          }
        }
      ]
    }
  }
}
GET trending/doc/_count
{
  "query": {
    "bool": {
      "must": [
        {
          "parent_id": {
            "type": "followings",
            "id": "u_5"
          }
        }
      ]
    }
  }
}
GET trending/doc/_search
{
  "size":2000,
  "query": {
    "bool": {
      "must": [
        {
          "parent_id": {
            "type": "followers",
            "id": "u_5"
          }
        }
      ]
    }
  }
}
GET trending/doc/_search
{
  "size":2000,
  "query": {
    "bool": {
      "must": [
        {
          "parent_id": {
            "type": "followings",
            "id": "u_5"
          }
        }
      ]
    }
  }
}

GET trending/doc/_search
{
  "size":2000,
  "query": {
    "bool": {
      "must": [
        {
          "parent_id": {
            "type": "followings",
            "id": "u_9600"
          }
        }
      ]
    }
  }
}
GET trending/doc/_search
{
  "size": 2000,
  "query": {
    "bool": {
      "must": [
        {
          "parent_id": {
            "type": "followers",
            "id": "u_9600"
          }
        }
      ],
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
GET trending/doc/_search
{
  "size":2000,
  "query": {
    "bool": {
      "must": [
        {
          "has_child": {
            "type": "followers",
             "query":{
               "bool":{
                 "must":{
                   "term":{
                     "object_id":"u_9600"
                   }
                 },
                 "must_not": [
                   {
                     "term":{
                       "user_id":"u_5"
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
GET trending/doc/_count
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "followings"
          }
        },
        {
          "parent_id": {
            "type": "followings",
            "id": "u_28665"
          }
        }
      ]
    }
  }
}
GET trending/doc/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "parent_id": {
            "type": "block",
            "id": "u_5"
          }
        }
      ]
    }
  }
}
GET trending/doc/_search
{
  "size":1000,
  "query": {
    "bool": {
      "must": [
        {
          "parent_id": {
            "type": "blocked",
            "id": "u_9600"
          }
        }
      ]
    }
  }
}
GET trending/doc/_search
{
  "_source": [
    "id",
    "text_content",
    "user_id",
    "created_at",
    "location"
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
              "bool": {
                "must": [
                  {
                    "term": {
                      "is_live": true
                    }
                  },
                  {
                    "has_child": {
                      "type": "followers",
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
                      "type": "block",
                      "inner_hits": {
                        "size":100,
                        "_source": [
                          "created_at",
                          "object_id",
                          "id"
                        ]
                      },
                      "query": {
                        "bool": {
                          "must_not": [
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
                      "inner_hits": {
                        "size":100,
                        "_source": [
                          "created_at",
                          "object_id",
                          "id"
                        ]
                      },
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
        }
      ]
    }
  },
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
  ]
}
