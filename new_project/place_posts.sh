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
                  },
                  {
                    "terms": {
                      "box_posts.location.fs_location_id.keyword": [
                        "ChIJjZajo-QEGTkRle2XyxzbyOI"
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
  },
  "aggs": {
    "places": {
      "nested": {
        "path": "box_posts"
      },
      "aggs": {
        "filtered": {
          "filter": {
            "range": {
              "box_posts.id": {
                "lt": 662
              }
            }
          },
          "aggs": {
            "top_posts": {
              "terms": {
                "size": 40,
                "field": "box_posts.id",
                "order": {
                  "sort_order_id": "desc"
                }
              },
              "aggs": {
                "sort_order_id": {
                  "min": {
                    "field": "box_posts.id"
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

