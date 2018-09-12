
POST trending/_update_by_query
{
  "script": {
    "source": " for (int i = 0; i < ctx._source.box_posts.size(); i++) { ctx._source.box_posts.get(i).user_id = ctx._source.box_user.id }",
    "lang": "painless"
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
            "path": "box_user",
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "box_user.id": 5
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
                "must": []
              }
            }
          }
        }
      ]
    }
  }
}


curl -XGET "http://localhost:9200/trending/doc/_count?pretty" -H 'Content-Type: application/json' -d'
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
                "must": [],
                "must_not": [
                    {
                      "exists":{
                        "field":"box_posts.created_location" 
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
}'

curl -XGET "http://localhost:9200/trending/doc/_count?pretty" -H 'Content-Type: application/json' -d'
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
                "must_not": [
                  {
                    "range": {
                      "age": {
                        "box_posts.created_location.lat": 0
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
  }
}'

curl -XGET "http://localhost:9200/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
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
  }
}'

curl -XGET "http://localhost:9200/trending/doc/_count?pretty"

curl -XGET "http://localhost:9200/users/user/_count?pretty"