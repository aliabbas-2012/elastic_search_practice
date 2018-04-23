GET /trending/_search
{
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
          "term": {
            "user_id": "u_5"
          }
        }
      ]
    }
  },
  "aggs": {
    "boxes": {
      "nested": {
        "path": "boxes"
      },
      "aggs": {
        "top_boxes": {
          "terms": {
            "field": "boxes.id",
            "size": 50
          },
          "aggs": {
            "top_sales_hits": {
              "top_hits": {
                "sort": [
                  {
                    "boxes.post_id": "desc"
                  }
                ],
                "size": 9
              }
            }
          }
        }
      }
    }
  }
}

# with dynamic data
GET /trending/_search
{
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
          "term": {
            "user_id": "u_5"
          }
        }
      ]
    }
  },
  "aggs": {
    "top_boxes": {
      "terms": {
        "field": "boxes_arr.id",
        "size": 50,
        "order": {
          "top_hit": "desc"
        }
      },
      "aggs": {
        "top_posts_hits": {
          "top_hits": {
            "sort": [
              {
                "boxes_arr.post_id": "desc"
              }
            ],
            "_source": {
              "includes": [
                "id"
              ]
            },
            "size": 9
          }
        },
        "top_hit": {
          "min": {
            "script": {
              "source": "return doc.created_at"
            }
          }
        }
      }
    }
  }
}