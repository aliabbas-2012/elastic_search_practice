curl -XPOST -H 'Content-Type: application/json' 'https://search-staging-node-v2-4-5zns7u6jcfgr4ohsvds54etdhu.us-west-2.es.amazonaws.com/trending/doc/_delete_by_query' -d '
{
  "query": {
    "bool": {
      "should": [
        {
          "term": {
            "type": "blocked"
          }
        },
        {
          "term": {
            "type": "block"
          }
        }
      ]
    }
  }
}'

curl -XPOST -H 'Content-Type: application/json' 'https://search-staging-node-v2-4-5zns7u6jcfgr4ohsvds54etdhu.us-west-2.es.amazonaws.com/trending/doc/_delete_by_query' -d '
{
  "query": {
    "bool": {
      "should": [
        {
          "term": {
            "type": "followings"
          }
        },
        {
          "term": {
            "type": "followers"
          }
        }
      ]
    }
  }
}'

curl -XPOST -H 'Content-Type: application/json' 'http://localhost:9200/trending/doc/_delete_by_query' -d '
{
  "query": {
    "bool": {
      "should": [
        {
          "term": {
            "type": "followings"
          }
        },
        {
          "term": {
            "type": "followers"
          }
        }
      ]
    }
  }
}'

curl -XGET -H 'Content-Type: application/json' https://search-staging-node-v2-4-5zns7u6jcfgr4ohsvds54etdhu.us-west-2.es.amazonaws.com/trending/doc/_count?pretty -d '
{
  "query" : {
      "bool":{
         "must": 
            {"term":{"type":"followings"}
         }
      }
   }
}'
