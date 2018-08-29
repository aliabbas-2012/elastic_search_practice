GET _cat/indices

PUT twitter
{
    "settings" : {
        "index" : {
            "number_of_shards" : 3, 
            "number_of_replicas" : 2 
        }
    }
}

POST /users/_search?size=0
{
    "aggs" : {
        "max_id" : { "max" : { "field" : "fo" } }
    }
}

POST /trending/_cache/clear
GET trending/_search
{
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
            "user_id": "u-5"
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
  }
}
GET users/user/_search
{

  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "username": "f"
          }
        }
      ]
    }
  }
}
GET trending/_search?size=0
{
  "_source": false,
  "size":0,
  "query":{
    "term":{
      "type":"box"
    }
  },
  "aggs": {
    "teams": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "team_name": {
          "terms": {
            "field": "box_posts.box_id"
          }
        }
      }
    }
  }
}
GET users/user/_count
GET users/user/_search
GET users/user/_search
{
  "_source": ["id"], 
  "query":{
    "term":{
      "id":"19712"
    }
  },
  "script_fields" : {
        "test1" : {
            "script" : {
                "lang": "painless",
                "source": "params._source.followers.length"
            }
        }
    }
}

GET users/user/_search
{
  "_source": ["id","followers"]
}
GET trending/doc/_search
{
  "_source": ["box_posts.id"],
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
            "id": ["bx-70889","bx-50851"]
          }
        }
      ]
    }
  }
}
POST users/_update_by_query?conflicts=proceed
{
  "conflicts": "proceed",
  "script": {
    "source": """
Map map1=new HashMap();List params_followers=params.pay_load.get(ctx._source.id);List followers=ctx._source.followers;List update_followers=new ArrayList();if(followers!=null&&followers.size()>0){for(int i=0;i<followers.size();i++){map1.put(followers.get(i).id,followers.get(i));}
for(int i=0;i<params_followers.size();i++){if(!map1.containsKey(params_followers.get(i).id)){update_followers.add(params_followers.get(i));}}
ctx._source.followers.addAll(update_followers);}else{ctx._source.followers=params_followers;}
""",
    "lang": "painless",
    "params": {
      "pay_load": {
        "7": [
          {
            "id": 6,
            "follower_id": 17,
            "status": "A"
          },
          {
            "id": 8,
            "follower_id": 19,
            "status": "A"
          }
        ]
      }
    }
  },
  "query": {
    "bool": {
      "must": [
        [
          {
            "terms": {
              "id": [
                7
              ]
            }
          }
        ]
      ]
    }
  }
}
GET trending/doc/_search
{
  "_source": [
    "id",
    "uid"
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
            "uid": "5b116375-8c51-11e8-954a-84ef18497b8b"
          }
        }
      ]
    }
  }
}
POST /users/_cache/clear
GET users/user/_search
{
  "_source": [
    "id",
    "uid",
    "is_live",
    "username",
    "picture",
    "full_name",
    "location"
  ],
  "from": 0,
  "size": 40,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "is_live": true
          }
        },
        {
          "nested": {
            "path": "boxes",
            "query": {
              "bool": {
                "must": [
                  {
                    "exists": {
                      "field": "boxes.id"
                    }
                  },
                  {
                    "range": {
                      "boxes.post_count": {
                        "gt": 0
                      }
                    }
                  }
                ]
              }
            }
          }
        },
        {
          "exists": {
            "field": "location"
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
                        "followers": [
                          5
                        ]
                      }
                    },
                    {
                      "nested": {
                        "path": "boxes",
                        "inner_hits": {
                           "sort": [
                            {
                              "boxes.id": {
                                "order": "asc"
                              }
                            }
                          ],
                          "_source": [
                            "boxes.id",
                            "boxes.name",
                            "boxes.status"
                          ]
                        },
                        "query": {
                          "bool": {
                            "must": [
                              {
                                "terms": {
                                  "boxes.status": [
                                    "F",
                                    "A"
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
              },
              {
                "bool": {
                  "must": [
                    {
                      "nested": {
                        "path": "boxes",
                        "inner_hits": {
                          "sort": [
                            {
                              "boxes.id": {
                                "order": "asc"
                              }
                            }
                          ],
                          "size": 20,
                          "_source": [
                            "boxes.id",
                            "boxes.name",
                            "boxes.status"
                          ]
                        },
                        "query": {
                          "bool": {
                            "must": [
                              {
                                "term": {
                                  "boxes.status": "A"
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
        }
      ]
    }
  },
  "script_fields": {
    "follow_status": {
      "script": {
        "lang": "painless",
        "params": {
          "user_id": 5
        },
        "source": "List followers=params._source.followers;HashSet hs=new HashSet();hs.addAll(followers);return hs.contains(params.user_id);"
      }
    },
    "box_count": {
      "script": {
        "lang": "painless",
        "params": {
          "user_id": 5
        },
        "source": "params._source.boxes.length;"
      }
    }
  },
  "sort": [
    {
      "_geo_distance": {
        "location": [
          74.67,
          31.71
        ],
        "order": "asc",
        "unit": "km",
        "mode": "min",
        "distance_type": "arc"
      }
    }
  ]
}