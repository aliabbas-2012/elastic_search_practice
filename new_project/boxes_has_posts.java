GET /trending/doc/_search
{
  "_source": [
    "db_id"
  ],
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
            "inner_hits": {
              "_source": [
                "box_posts.id",
                "box_posts.created_location"
              ]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "exists": {
                      "field": "box_posts.id"
                    }
                  }
                ],
                "must_not": [
                  {
                    "exists": {
                      "field": "box_posts.created_location"
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