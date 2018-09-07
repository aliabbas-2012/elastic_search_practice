curl -XGET "http://localhost:9200/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size": 3,
  "_source": false,
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
            "inner_hits":{
                "_source":["box_posts.id","box_posts.text_content","box_posts.post_media"]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "box_posts.id": 3953714
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