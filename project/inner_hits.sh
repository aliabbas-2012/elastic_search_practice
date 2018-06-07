GET /trending/doc/_search
{
  "size": 1,
  "query": {
    "bool": {
      "should": [
        {
          "bool": {
            "must": [
              {
                "term": {
                  "type": "post"
                }
              },
              {
                "term": {
                  "id": "p-125051"
                }
              }
            ]
          }
        },
        {
          "has_child": {
            "type": "likes",
            "inner_hits": {
              "size": 1,
              "_source":["id","user_id","object_id"]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "term":{
                      "user_id":"u-18368"
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


GET /trending/doc/_search
{
  "size": 1,
  "query": {
    "bool": {
      "should": [
        {
          "bool": {
            "must": [
              {
                "term": {
                  "type": "post"
                }
              },
              {
                "term": {
                  "id": "p-125051"
                }
              }
            ]
          }
        },
        {
          "has_child": {
            "type": "likes",
            "inner_hits": {
              "size": 1,
              "_source": [
                "id",
                "user_id",
                "object_id"
              ]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "user_id": "u-18368"
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
    "to-answers": {
      "children": {
        "type": "likes"
      },
      "aggs": {
        "top-names": {
          "terms": {
            "field": "object_id",
            "size": 1
          }
        }
      }
    }
  }
}