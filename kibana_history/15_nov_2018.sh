GET _cat/indices
GET /user-trending
GET /trending/doc/_mapping?pretty

GET /trending/doc/_search?pretty
{
  "size": 100,
  "_source":["username","is_live","db_id"],
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        }
      ]
    }
  }
}
GET /trending/doc/_search?pretty  
{
  "_source": [
    "id",
    "username"
  ],
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "db_id": 5
          }
        },
        {
          "term": {
            "type": "user"
          }
        },
        {
          "bool": {
            "must_not": [
              {
                "has_child": {
                  "type": "blocked",
                  "query": {
                    "term": {
                      "user_id": "u-3"
                    }
                  }
                }
              },
              {
                "has_child": {
                  "type": "block",
                  "query": {
                    "term": {
                      "user_id": "u-3"
                    }
                  }
                }
              }
            ]
          }
        }
      ]
    }
  }
}

GET /trending/doc/_search?pretty  
{
  "query": {
    "bool": {
      "must": [
        {
          "bool": {
            "should": [
              {
                "term": {
                  "type": "followings"
                }
              },
              {
                "term": {
                  "type": "followers"
                }
              }
            ]
          }
        },
        {
          "term": {
            "db_id": 27
          }
        }
      ]
    }
  }
}

GET /trending/doc/_search?pretty  
{
  "query": {
    "bool": {
      "must": [
        {
          "bool": {
            "must": [
              {
                "parent_id": {
                  "type": "blocked",
                  "id": "u-2"
                }
              }
            ]
          }
        }
      ]
    }
  }
}
GET /trending/doc/_search?pretty
{
  "size": 100,
  "_source": ["id","db_id","name","status"],
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
            "db_id": 1605748
          }
        }
      ]
    }
  }
}


POST trending/_delete_by_query
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        },
        {
          "term": {
            "db_id": 33736
          }
        }
      ]
    }
  }
}

GET /user-trending/_search?pretty 
POST trending/_delete_by_query
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "box"
          }
        },
        {
          "terms": {
            "db_id": [
              548572,
              548573,
              548574,
              548575,
              548576,
              548577,
              548578,
              548579,
              548580,
              548581,
              548582,
              548583,
              548584,
              548585,
              548586,
              548587,
              548589,
              548590,
              548591,
              548594,
              548595,
              548597,
              548601,
              548612,
              548613,
              548614,
              548615,
              548616,
              548617,
              548619,
              548620,
              548628,
              548632,
              548634,
              548636,
              548638,
              548642,
              548646
            ]
          }
        }
      ]
    }
  }
}
GET /trending/doc/_mapping
GET /trending/doc/_search?pretty
{
  "_source": [
    "id",
    "username",
    "full_name"
  ],
  "size": 5,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        },
        {
          "wildcard": {
            "username": {
              "wildcard": "*khosa*",
              "boost": 2
            }
          }
        }
      ]
    }
  }
}
GET user-trending/_mapping
GET user-trending/doc/_search?pretty
{
  
  "size": 200,
  "query": {
    "bool": {
      "must": [
       
        {
          "term": {
            "type": "box"
          }
        }
      ]
    }
  }
}
GET trending/doc/_search?pretty
{
  
  "size": 200,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "post"
          }
        },
        {
          "term": {
            "user_id": "u-19768"
          }
        }
      ]
    }
  }
}

GET /trending/doc/_search?pretty
{
  "_source": [
    "id",
    "uid",
    "db_id",
    "is_live",
    "username",
    "full_name",
    "bucket",
    "picture"
  ],
  "from": 0,
  "size": 40,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        },
        {
          "bool": {
            "should": []
          }
        },
        {
          "has_child": {
            "type": "followings",
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "user_id": "u-5"
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
          }
        },
        {
          "bool": {
            "should": []
          }
        }
      ],
      "must_not": [
        {
          "term": {
            "db_id": 5
          }
        },
        {
          "has_child": {
            "type": "blocked",
            "query": {
              "term": {
                "user_id": "u-5"
              }
            }
          }
        },
        {
          "has_child": {
            "type": "blocked",
            "query": {
              "term": {
                "user_id": "u-5"
              }
            }
          }
        }
      ],
      "should": []
    }
  }
}

PUT trending/_mapping/doc
{
  "properties": {
    "name": {
      "type": "text",
      "index": true,
      "analyzer": "autocomplete",
      "search_analyzer": "standard",
      "fielddata": true,
      "fields": {
        "raw": {
          "type": "keyword",
          "index": true
        }
      }
    }
  }
}
GET /trending/doc/_search?pretty
{
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
        }
      ]
    }
  },
  "from":0,
  "size": 20,
  "_source": [
    "db_id",
    "name",
    "status",
    "box_posts"
  ],
  "sort": [
    {
      "box_posts.id": {
        "mode": "max",
        "nested": {
          "path": "box_posts"
        },
        "order": "desc"
      }
    }
  ]
}

GET trending/doc/_search
{
  "from": 0,
  "size": 10,
  "_source": false,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        },
        {
          "has_child": {
            "type": "box",
            "inner_hits": {
              "size": 1,
              "name":"box_chid",
              "_source": [
                "name",
                "status",
                "id"
              ],
              "sort": {
                "created_at": "desc"
              }
            },
            "query": [
              {
                "term": {
                  "status": "A"
                }
              },
              {
                "nested": {
                  "path": "box_posts",
                  "inner_hits": {
                    "sort": [
                      {
                        "_geo_distance": {
                          "box_posts.created_location": [
                            74.3,
                            31.4
                          ],
                          "order": "asc",
                          "unit": "km",
                          "mode": "min",
                          "distance_type": "arc"
                        }
                      }
                    ],
                    "size": 4
                  },
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
            ]
          }
        },
        {
          "term": {
            "is_live": true
          }
        },
        {
          "bool": {
            "must_not": {
              "bool": {
                "should": [
                  {
                    "has_child": {
                      "type": "blocked",
                      "query": {
                        "bool": {
                          "must": [
                            {
                              "term": {
                                "user_id": "u-2"
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
                        "term": {
                          "user_id": "u-2"
                        }
                      }
                    }
                  },
                  {
                    "has_child": {
                      "type": "followers",
                      "query": {
                        "bool": {
                          "must": [
                            {
                              "term": {
                                "user_id": "u-2"
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
    "sort" : [
      {
         "id" : {
            "mode" :  "min",
            "order" : "asc",
            "nested": {
               "path": "box",
               "filter": {
                  "range": {"parent.age": {"gte": 21}}
               }
               
            }
         }
      }
   ]
}
GET trending/doc/_search?pretty
{
  "_source":["id","name"],
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
            "user_id": "u-19759"
          }
        }
      ]
    }
  }
}
GET trending/doc/_search
{
  "size": 500,
  "_source": [
    "id",
    "uid",
    "facebook_id",
    "is_live",
    "username",
    "full_name",
    "picture",
    "full_name",
    "location",
    "bucket"
  ],
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        },
        {
          "term": {
            "is_live": true
          }
        },
        {
          "exists": {
            "field": "created_location"
          }
        },
        {
          "bool": {
            "should": [
             
           
            ]
          }
        },
        {
          "has_child": {
            "type": "box",
            "query": {
              "bool": {
                "should": [
                  {
                    "bool": {
                      "must": [
                        {
                          "has_parent": {
                            "parent_type": "user",
                            "query": {
                              "bool": {
                                "should": [
                                 
                                ]
                              }
                            }
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
                  },
                  {
                    "bool": {
                      "must": [
                        {
                          "nested": {
                            "path": "box_posts",
                            "inner_hits": {
                              "_source": [
                                "box_posts.id",
                                "box_posts.post_media.file",
                                "box_posts.post_media.file_width",
                                "box_posts.post_media.file_height",
                                "box_posts.post_media.bucket",
                                "box_posts.post_media.file_type_number"
                              ],
                              "size": 4,
                              "sort": [
                                {
                                  "box_posts.id": {
                                    "order": "desc"
                                  }
                                }
                              ]
                            },
                            "query": {
                              "bool": {
                                "must": [
                                  {
                                    "exists": {
                                      "field": "box_posts.id"
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
                ]
              }
            },
            "inner_hits": {
              "_source": [
                "db_id",
                "id",
                "name",
                "status"
              ],
              "size": 4,
              "sort": {
                "box_posts.id": "desc"
              }
            }
          }
        }
      ],
      "must_not": [
        [
          {
            "has_child": {
              "type": "blocked",
              "query": {
                "term": {
                  "user_id": "u-5"
                }
              }
            }
          },
          {
            "has_child": {
              "type": "block",
              "query": {
                "term": {
                  "object_id": "u-5"
                }
              }
            }
          },
          {
            "term": {
              "db_id": 5
            }
          }
        ]
      ]
    }
  },
  "sort": []
}

GET trending/doc/_search
{
  "size": 4,
  "_source": [
    "id",
    "db_id",
    "name",
    "status"
  ],
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
            "must": {
              "bool": {
                "should": [
                  {
                    "bool": {
                      "must": [
                        {
                          "terms": {
                            "status": [
                              "A",
                              "F"
                            ]
                          }
                        },
                        {
                          "terms": {
                            "id": []
                          }
                        },
                        {
                          "bool": {
                            "should": [
                              {
                                "bool": {
                                  "must": {
                                    "nested": {
                                      "path": "box_posts",
                                      "query": {
                                        "bool": {
                                          "must": []
                                        }
                                      },
                                      "inner_hits": {
                                        "size": 4,
                                        "_source": [
                                          "box_posts.id",
                                          "box_posts.post_media"
                                        ],
                                        "sort": {
                                          "box_posts.id": {
                                            "order": "desc"
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              },
                              {
                                "bool": {
                                  "must_not": {
                                    "nested": {
                                      "path": "box_posts",
                                      "query": {
                                        "bool": {
                                          "must": []
                                        }
                                      }
                                    }
                                  }
                                }
                              }
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
                            "status": [
                              "A"
                            ]
                          }
                        },
                        {
                          "nested": {
                            "path": "box_user",
                            "query": {
                              "term": {
                                "box_user.is_private": false
                              }
                            }
                          }
                        },
                        {
                          "terms": {
                            "id": [
                              "bx-98275",
                              "bx-68914",
                              "bx-399",
                              "bx-48370"
                            ]
                          }
                        },
                        {
                          "bool": {
                            "should": [
                              {
                                "bool": {
                                  "must": {
                                    "nested": {
                                      "path": "box_posts",
                                      "query": {
                                        "bool": {
                                          "must": []
                                        }
                                      },
                                      "inner_hits": {
                                        "size": 4,
                                        "_source": [
                                          "box_posts.id",
                                          "box_posts.post_media"
                                        ],
                                        "sort": {
                                          "box_posts.id": {
                                            "order": "desc"
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              },
                              {
                                "bool": {
                                  "must_not": {
                                    "nested": {
                                      "path": "box_posts",
                                      "query": {
                                        "bool": {
                                          "must": []
                                        }
                                      }
                                    }
                                  }
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
            }
          }
        },
        {
          "has_parent": {
            "parent_type": "user",
            "query": {
              "bool":{
                "must_not": [
        [
          {
            "has_child": {
              "type": "blocked",
              "query": {
                "term": {
                  "user_id": "u-5"
                }
              }
            }
          },
          {
            "has_child": {
              "type": "block",
              "query": {
                "term": {
                  "object_id": "u-5"
                }
              }
            }
          }
          
        ]
      ]
              }
            }
          }
        }
      ]
    }
  }
}
GET trending/_cache/clear
GET trending/doc/_search
{
  "from": 0,
  "size": 500,
  "_source":["db_id","username","picture","full_name","uid"],
  "sort": [
    {
      "_score": {
        "order": "desc"
      }
    },
    {
      "username.raw": {
        "order": "asc"
      }
    }
  ],
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        },
        {
          "multi_match": {
            "query": "fahad",
            "type": "best_fields",
            "fields": [
              "username.raw^4",
              "username",
              "full_name.raw",
              "full_name"
            ]
          }
        }
      ],
      "should": [
        {
          "bool": {
            "must": [
             
              {
                "has_child": {
                  "type": "box",
                  "query": {
                    "bool": {
                      "should": [
                        {
                          "bool": {
                            "must": [
                              {
                                "has_parent": {
                                  "parent_type": "user",
                                  "query": {
                                    "bool": {
                                      "should": [
                                        {
                                          "term": {
                                            "is_live": true
                                          }
                                        }
                                      ]
                                    }
                                  }
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
                        },
                        {
                          "bool": {
                            "must": [
                              {
                                "nested": {
                                  "path": "box_posts",
                                  "query": {
                                    "bool": {
                                      "must": [
                                        {
                                          "exists": {
                                            "field": "box_posts.id"
                                          }
                                        }
                                      ]
                                    }
                                  }
                                }
                              },
                              {
                                "has_parent": {
                                  "parent_type": "user",
                                  "query": {
                                    "bool": {
                                      "should": [
                                        {
                                          "has_child": {
                                            "type": "followers",
                                            "inner_hits": {
                                              "_source": false,
                                              "size": 1
                                            },
                                            "query": {
                                              "bool": {
                                                "must": [
                                                  {
                                                    "term": {
                                                      "user_id": 6
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
                                          }
                                        }
                                      ]
                                    }
                                  }
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
                        }
                      ]
                    }
                  }
                }
              }
            ]
          }
        }
      ],
      "must_not": [
        {
          "term": {
            "db_id": 6
          }
        },
        {
          "has_child": {
            "type": "blocked",
            "query": {
              "term": {
                "user_id": "u-6"
              }
            }
          }
        },
        {
          "has_child": {
            "type": "block",
            "query": {
              "term": {
                "object_id": "u-6"
              }
            }
          }
        }
      ]
    }
  }
}
GET /trending/doc/_search?pretty
{
  "_source": [
    "is_live"
  ],
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        },
        {
          "term": {
            "id": "u-2"
          }
        }
      ]
    }
  }
}
GET /trending/doc/_search?pretty
{
  "_source": ["id","user_id","object_id","status"], 
  "query": {
    "bool": {
      "must": [
        {
          "bool": {
            "should": [
              {
                "term": {
                  "type": "followings"
                }
              },
               {
                "term": {
                  "type": "followers"
                }
              }
            ]
          }
        },
        {
          "term": {
            "user_id": "u-28327"
          }
        },
        {
          "term": {
            "object_id": "u-2"
          }
        }
      ]
    }
  }
}
GET /trending/doc/_search?pretty
{
  "_source": ["id","user_id","object_id"], 
  "query": {
    "bool": {
      "must": [
        {
          "bool": {
            "should": [
              {
                "term": {
                  "type": "blocked"
                }
              },
               {
                "term": {
                  "type": "block"
                }
              }
            ]
          }
        },
        {
          "term": {
            "user_id": "u-1061208"
          }
        },
        {
          "term": {
            "object_id": "u-28327"
          }
        }
      ]
    }
  }
}
GET /trending/_cache/clear
GET /trending/doc/_search?pretty
{
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
          "terms": {
            "status": [
              "A",
              "M",
              "F"
            ]
          }
        }
      ]
    }
  },
  "from": 0,
  "size": 20,
  "_source": [
    "db_id",
    "name",
    "status"
  ],
  "sort": [
    {
      "db_id": {
        "order": "desc"
      }
    }
  ]
}
GET /trending/_cache/clear
GET /trending/doc/_search?pretty
{
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
          "terms": {
            "status": [
              "A",
              "M",
              "F"
            ]
          }
        }
      ]
    }
  },
  
  "_source": ["name","created_at"],
  "size": 200,
   "sort": [
    {
      "created_at": {
        "order": "desc"
      }
    }
  ],
  "aggs": {
    "posts": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "post_count": {
          "cardinality": {
            "field": "box_posts.id"
          }
        }
      }
    }
  }
}
GET /trending/_cache/clear
GET /trending/doc/_search?pretty
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "box"
          }
        },
        {
          "terms": {
            "db_id": [
             19768
            ]
          }
        }
      ]
    }
  },
  "_source": false,
  "size": 0,
  "sort": [
    {
      "created_at": {
        "order": "desc"
      }
    }
  ],
  "aggs": {
    "posts": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "filtered": {
          "filter": {
            "bool": {
              "must": {
                "term": {
                  "box_post.id": 278
                }
              }
            }
          },
          "aggs": {
            "group_max_b_box_id": {
              "terms": {
                "field": "box_posts.box_id"
              },
              "aggs": {
                "max_price": {
                  "max": {
                    "field": "box_posts.created_at"
                  }
                }
              }
            },
            "group_by_count_by_box_id": {
              "terms": {
                "field": "box_posts.box_id"
              },
              "aggs": {
                "post_count": {
                  "cardinality": {
                    "field": "box_posts.id"
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

POST user-trending-search/_delete_by_query
{
  "query": { 
    "bool": {
      "must":[
        ]
    }
  }
}
GET trending/doc/_search?pretty
{
  "query": {
    "bool": {
      "must": [
        {
          "term":{
             "type": "views"
          }
         
        }
      ]
    }
  }
}
POST trending/_delete_by_query
{
  "query": {
    "bool": {
      "must": [
        {
          "term":{
             "type": "views"
          }
         
        }
      ]
    }
  }
}
GET /_cat/indices

POST profile-boxes-cache/_delete_by_query
{
  "query": {
    "bool": {
      "must": []
    }
  }
}
GET profile-boxes-cache/_cache/clear
GET profile-boxes-cache/doc/_search?pretty
{
  "from": 0,
  "size": 200,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "user_id": 19768
          }
        }
      ]
    }
  },
  "sort": [
    {
      "indexed_at": {
        "order": "desc"
      }
    }
  ]
}



GET /trending/_cache/clear
GET /trending/doc/_search?pretty
{
  "_source": false,
  "size": 1,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "box"
          }
        },
        {
          "terms": {
            "db_id": [
              548645
            ]
          }
        },
        {
          "nested": {
            "path": "box_posts",
            "inner_hits": {
              "size":1
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "term":{
                      "box_posts.id": 278 
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

POST profile-boxes-cache/_delete_by_query
{
    "query": {
    "bool": {
      "must": [
       
        {
          "terms": {
            "id": [
              548572,548573,548574,548575,548576,548577,548578,548579,548580,548581,548582,548583,548584,548585,548586,548587,548589,548590,548591,548594,548595,548597,548601,548612,548613,548614,548615,548616,548617,548619,548620,548628,548632,548634
            ]
          }
        }
      ]
    }
  }
}

GET /trending/doc/_search?pretty
{
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
            "user_id": "u-28327"
          }
        }
      ]
    }
  },
  
  "_source": false,
  "size": 0,
  "aggs": {
    "posts": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "post_count": {
          "cardinality": {
            "field": "box_posts.id"
          }
        }
      }
    }
  }
}

GET /trending/doc/_search?pretty
{
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
            "user_id": "u-28327"
          }
        }
      ]
    }
  },
  "_source": false,
  "size": 0,
  "aggs": {
    "posts": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "sample": {
          "terms": {
            "field": "box_posts.id",
            "size": 1
          },
          "aggs": {
            "internal_cardinality": {
              "reverse_nested": {},
              "aggs": {
                "cid": {
                  "cardinality": {
                    "field": "box_posts.id"
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

GET /trending/doc/_search?pretty
{"size":30000,"_source":false,"query":{"bool":{"must":[{"term":{"type":"box"}},{"terms":{"db_id":[]}},{"nested":{"path":"box_posts","query":{"bool":{"must":[{"range":{"box_posts.id":{"gt":0}}}]}}}}]}}}

GET /trending/doc/_search?pretty
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "box"
          }
        },
        {
          "nested": {
            "path": "box_posts",
            "query": {
              "bool": {
                "must": [
                  {
                    "range": {
                      "box_posts.id": {
                        "gt": 0
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
  "_source": false,
  "size": 0,
  "aggs": {
    "posts": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "post_count": {
          "cardinality": {
            "field": "box_posts.id"
          }
        }
      }
    }
  }
}
GET /trending/doc/_count?pretty
{"query":{"bool":{"must":[{"term":{"type":"box"}},{"terms":{"db_id":[]}}]}}}

POST trending/_update_by_query
{
  "script": {
    "source": "for(int i=0;i<ctx._source.box_posts.size();i++){for(int j=0;j<params.post_ids.size();j++){if(ctx._source.box_posts[i].id==params.post_ids.get(j)){ctx._source.box_posts.remove(params.post_ids.get(j));}}}",
    "lang": "painless",
    "params": {
      "post_ids": [
          3959243,3959239,3959238,3959237,3959236,3959235,3941886,3955397,3953599,3955436,3953083,47404,3959228,3959226,3959093,3959138,3959137,3959136,3959135,3959134,3959133,3959132,3959131,3959130,3959097,3959090,3959088,3959086,3959042,3959038,3959037,3958861,3958858,3956692,3956665,3956583,3956476,3956468,3956467,3956466,3956465,3956464,3956463,3956462,3956461,3956460,3959141,3959140,3959034,3959032,3957242,3956678,3959165,3959154,3959091,3959185,3959184,3959167,3959166,3959164,3959163,3959162,3959161,3959160,3959159,3959158,3959157,3959156,3959155,3959153,3959152,3959151,3959150,3959149,3959148,3959147,3959146,3959145,3959144,3959143,3959142,3959089,3959087,3959085,3959084,3956585,3959195,3959115,3956750,3956703,3956693,3716661,3124797,2934736,2838187,2405115,1969587,1783886,1238149,811651,698482,517692,460127,3959194,3959193,3959192,3956599,3956598,3956531,3154526,3098378,2849255,2200276,1926629,1902001,1449787,1444607,1026552,312755,123082,3959188,3959187,3959186,3956730,3956734,3959181,3959182,3959183,3959171 
        ] 
    }
  },
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "box"
          }
        },
        {
          "nested": {
            "path": "box_posts",
            "query": {
              "bool": {
                "must": [
                  {
                    "terms": {
                      "box_posts.id": [
                       3959243,3959239,3959238,3959237,3959236,3959235,3941886,3955397,3953599,3955436,3953083,47404,3959228,3959226,3959093,3959138,3959137,3959136,3959135,3959134,3959133,3959132,3959131,3959130,3959097,3959090,3959088,3959086,3959042,3959038,3959037,3958861,3958858,3956692,3956665,3956583,3956476,3956468,3956467,3956466,3956465,3956464,3956463,3956462,3956461,3956460,3959141,3959140,3959034,3959032,3957242,3956678,3959165,3959154,3959091,3959185,3959184,3959167,3959166,3959164,3959163,3959162,3959161,3959160,3959159,3959158,3959157,3959156,3959155,3959153,3959152,3959151,3959150,3959149,3959148,3959147,3959146,3959145,3959144,3959143,3959142,3959089,3959087,3959085,3959084,3956585,3959195,3959115,3956750,3956703,3956693,3716661,3124797,2934736,2838187,2405115,1969587,1783886,1238149,811651,698482,517692,460127,3959194,3959193,3959192,3956599,3956598,3956531,3154526,3098378,2849255,2200276,1926629,1902001,1449787,1444607,1026552,312755,123082,3959188,3959187,3959186,3956730,3956734,3959181,3959182,3959183,3959171
                      ]
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


GET /trending/doc/_search?pretty
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
        },
        {
          "bool": {
            "must_not": {
              "has_parent": {
                "parent_type": "user",
                "query": {
                  "bool": {
                    "should": [
                      {
                        "has_child": {
                          "type": "blocked",
                          "query": {
                            "bool": {
                              "must": [
                                {
                                  "term": {
                                    "user_id": "u-33737"
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
                            "term": {
                              "user_id": "u-33737"
                            }
                          }
                        }
                      },
                      {
                        "has_child": {
                          "type": "followers",
                          "query": {
                            "bool": {
                              "must": [
                                {
                                  "term": {
                                    "user_id": "u-33737"
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
                        }
                      },
                      {
                        "term": {
                          "db_id": 33737
                        }
                      }
                    ]
                  }
                }
              }
            }
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
              "must_not": [
                {
                  "terms": {
                    "box_posts.id": []
                  }
                }
              ]
            }
          },
          "aggs": {
            "top_users": {
              "terms": {
                "size": "200",
                "order": {
                  "score_order": "desc",
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
                      "source": "try { return doc['box_posts.created_location'].planeDistance(params.lat,params.lon) } catch(Exception ex) { return false }",
                      "params": {
                        "lon": 74.3521123883948,
                        "lat": 31.5310412005521
                      }
                    }
                  }
                },
                "score_order": {
                  "max": {
                    "field": "score"
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
POST trending/_update_by_query
{
  "script": {
    "source": "ctx._source.facebook_id = '';ctx._source.picture= ''",
    "lang": "painless"
  },
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        },
        {
          "term": {
            "db_id": "19771"
          }
        }
      ]
    }
  }
}