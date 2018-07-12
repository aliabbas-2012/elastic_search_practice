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