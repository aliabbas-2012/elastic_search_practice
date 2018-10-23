curl -XGET "https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/users/user/31098?pretty"


curl -XGET "https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/posts/post/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query":{
    "term":{
      "user_id":31098
    }
  }
}'

curl -XGET "https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "id": "u-31098"
          }
        },
        {
          "term": {
            "type": "user"
          }
        }
      ]
    }
  }
}'

curl -XGET "https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "user_id": "u-31098"
          }
        },
        {
          "term": {
            "type": "post"
          }
        }
      ]
    }
  }
}'


curl -X POST "https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_delete_by_query" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "user_id": "u-31098"
          }
        },
        {
        	"term":{
        		"id":"p-163365"
        	}
        },
        {
          "term": {
            "type": "post"
          }
        }
      ]
    }
  }
}'

curl -XGET "https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "object_id": "u-31098"
          }
        },
        {
          "term": {
            "type": "followings"
          }
        }
      ]
    }
  }
}'

curl -XGET "https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size":1,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "user_id": "u-31098"
          }
        },
        {
          "term": {
            "type": "user_likes"
          }
        }
      ]
    }
  }
}'
curl -X POST "https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_delete_by_query" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "should": [
        {
          "bool": {
            "must": [
              {
                "term": {
                  "user_id": "u-31098"
                }
              },
              {
                "term": {
                  "type": "likes"
                }
              }
            ]
          }
        },
        {
          "bool": {
            "must": [
              {
                "term": {
                  "user_id": "u-31098"
                }
              },
              {
                "term": {
                  "type": "user_likes"
                }
              }
            ]
          }
        }
      ]
    }
  }
}'

curl -X POST "https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_delete_by_query?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "should": [
        {
          "bool": {
            "must": [
              {
                "term": {
                  "object_id": "p-163365"
                }
              },
              {
                "term": {
                  "type": "likes"
                }
              }
            ]
          }
        },
        {
          "bool": {
            "must": [
              {
                "term": {
                  "object_id": "p-163365"
                }
              },
              {
                "term": {
                  "type": "user_likes"
                }
              }
            ]
          }
        }
      ]
    }
  }
}'