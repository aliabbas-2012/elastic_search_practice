GET trending/doc/_search
{
  "size": 10,
  "_source": [
    "id",
    "username"
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
          "has_child": {
            "inner_hits": {
              "size": 1,
              "sort": [
                {
                  "created_at": "desc"
                }
              ],
              "_source": [
                "created_at",
                "score",
                "id",
                "text_content",
                "location"
              ]
            },
            "query": {
              "function_score": {
                "functions": [
                  {
                    "field_value_factor": {
                      "factor": 1,
                      "field": "created_at"
                    }
                  }
                ]
              }
            },
            "score_mode": "max",
            "type": "post"
          }
        }
      ]
    }
  }
}

GET trending/doc/p_125614
GET trending/doc/_search
{
  "size": 40,
  "_source": [
    "id",
    "username"
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
          "has_child": {
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
                "created_at",
                "score",
                "id",
                "text_content",
                "location"
              ]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "type": "post"
                    }
                  },
                  {
                    "function_score": {
                      "functions": [
                        {
                          "field_value_factor": {
                            "factor": 2,
                            "field": "created_at"
                          }
                        },
                        {
                          "script_score": {
                            "script": {
                              "source": "return doc['location'].planeDistance(params.lat,params.lon)",
                              "params": {
                                "lon": 74.34,
                                "lat": 31.54
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
            "score_mode": "max",
            "type": "post"
          }
        }
      ],
      "must_not": [
        {
          "bool": {
            "must": [
              {
                "term": {
                  "id": "u_5"
                }
              }
            ]
          }
        }
      ]
    }
  }
}