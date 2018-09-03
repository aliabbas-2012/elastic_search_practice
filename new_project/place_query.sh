GET trending/doc/_search
{
  "size": 0,
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
            "query": {
              "bool": {
                "must": [
                  {
                    "exists": {
                      "field": "box_posts.place"
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
    "boxes": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "top_boxes": {
          "terms": {
            "field": "box_posts.location.fs_location_id.keyword"
          },
          "aggs": {
            "top_posts": {
              "top_hits": {
                "sort": [
                  {
                    "box_posts.id": {
                      "order": "desc"
                    }
                  }
                ],
                "_source": {
                  "includes": [
                    "box_posts.id",
                    "box_"
                  ]
                },
                "size": 20
              }
            }
          }
        }
      }
    }
  }
}

