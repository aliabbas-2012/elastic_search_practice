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
  "size": 200,
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
                        "query": {
                          "bool": {
                            "must": [
                              {
                                "terms": {
                                  "boxes.status":["F","A"]
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
                        "query": {
                          "bool": {
                            "must": [
                              {
                                "term": {
                                  "boxes.status":"A"
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
    "is_following": {
     "script": {
                        "lang": "painless",
                        "source": "return params._source.followings.contains(params.user_id)",
                        "params": {
                            "user_id": 5
                        }

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