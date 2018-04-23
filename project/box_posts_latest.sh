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