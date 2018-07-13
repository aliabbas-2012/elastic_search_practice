GET /users/user/2002
GET trending\doc\_search
{
  "query":{
    "bool":{
      "must":[
          {
          "term":{
            "type":"followers"
          }
        }
        ]
        
      
    }
  }
}

GET /users/user/18368?version=1

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
POST /trending/_cache/clear
POST trending/doc/_search
{
  "_source": false,
  "size": 300,
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
            "inner_hits": {
              "size": 1,
              "_source": [
                "id",
                "username"
              ]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "has_child": {
                      "type": "followers",
                      "inner_hits": {
                        "size": 1,
                        "_source": [
                          "user_id",
                          "object_id"
                        ]
                      },
                      "query": {
                        "bool":{
                          "must":{
                            "term":{
                              "user_id":"u-617"
                            }
                          }
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
  "sort": [
    {
      "db_id": {
        "order": "desc"
      }
    }
  ]
}
POST /trending/_cache/clear
POST trending/doc/_search
{
  "query":{
    "term": {
      "id": "p-3956416"
    }
  }
}
POST trending/_update_by_query
{
  "script": {
    "source": "ctx._source.content = '123@@@@@ABCDdd'",
    "lang": "painless"
  },
  "query": {
    "term": {
      "id": "p-3956416"
    }
  }
}
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
            "inner_hits": {
              "size": 1,
              "_source": [
                "id",
                "username"
              ]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "has_child": {
                      "type": "followers",
                      "inner_hits": {
                        "size": 1,
                        "_source": [
                          "user_id",
                          "object_id"
                        ]
                      },
                      "query": {
                        "bool":{
                          "must":{
                            "term":{
                              "user_id":"u-2"
                            }
                          }
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
        "size": 40,
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
                  "user_id": "u-2"
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

POST trending/doc/_search
{

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
  },
   "sort": [
   		{
   			"db_id":{"order":"asc"}
   		}
   	]
}

POST trending/doc/_search
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
            "user_id": ["u-2","u-3"]
          }
        }
      ]
    }
  },
  "size": 0,
  "aggs": {
    "by_location": {
      "terms": {
        "field": "user_id",
        "size": 1000
      },
      "aggs": {
        "tops": {
          "top_hits": {
            "size": 100,
            "_source": {
              "includes": [
                "id"
              ]
            }
          }
        }
      }
    }
  }
}

DELETE  my_index
PUT /my_index
{
  "mappings": {
    "type1": {
      "properties": {
        "obj1": {
          "type": "nested",
          "properties": {
            "location": {
              "type": "geo_point",
              "index": true
            }
          }
        }
      }
    }
  }
}

PUT /my_index/type1/1
{
  "obj1": [
    {
      "location": {
          "lat": 40.12,
          "lon": -71.34
        }
    }
  ]
}
GET /my_index/_search

GET /my_index/_search
{
  "query": {
    "bool": {
      "filter": {
        "nested": {
          "path": "obj1",
          "query": {
            "bool": {
              "filter": {
                "geo_distance": {
                  "distance": "200km",
                  "obj1.location": {
                    "lat": 40,
                    "lon": -70
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
GET /my_index/type1/_search
{
  "filter" : {
    "nested" : {
      "path" : "obj1",
      "filter" : {
        "geo_distance": {
          "distance": "100 mi",
          "GeoPoint": {
            "lat": 40.70,
            "lon": -74.00
          }
        }
      }
    }
  }
}

