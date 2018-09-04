curl -XGET "http://localhost:9200/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size": 1,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "followings"
          }
        },
        {
          "term": {
            "user_id": "u-5"
          }
        },
        {
          "term": {
            "object_id": "u-92680"
          }
        }
      ]
    }
  }
}'

curl -XGET "http://localhost:9200/users/user/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "_source": [
    "blocked_me_list",
    "my_block_list",
    "is_live"
  ],
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "id": "5"
          }
        },
        {
          "nested": {
            "path": "followings",
            "inner_hits":{
              "_source":["followings.id","followings.following_id","followings.status"]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "exists": {
                      "field": "followings.id"
                    }
                  },
                  {
                    "terms": {
                      "followings.id": [
                        1881162
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
}'

