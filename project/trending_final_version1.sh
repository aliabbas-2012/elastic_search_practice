GET trending/doc/_search
{
  "size":5000,
  "_source": [
    "id",
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
                                "user_id": ["u_5"]
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
    }
  ]
}