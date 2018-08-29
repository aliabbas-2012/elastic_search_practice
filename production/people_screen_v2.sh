GET /trending/doc/_search
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
            "type": "user"
          }
        },
        {
          "bool": {
            "should": [
              {
                "bool": {
                  "must": [
                    {
                      "has_child": {
                        "type": "box",
                        "query": {
                          "bool": {
                            "must": [
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
                      }
                    },
                    {
                      "has_child": {
                        "type": "followers",
                        "inner_hits": {
                          "_source": [
                            "user_id",
                            "object_id"
                          ]
                        },
                        "query": {
                          "bool": {
                            "must": [
                              {
                                "term": {
                                  "user_id": "u-5"
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
                      "has_child": {
                        "type": "box",
                        "query": {
                          "bool": {
                            "must": [
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