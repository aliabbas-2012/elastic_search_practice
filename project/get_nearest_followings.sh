GET trending/doc/_search
{
  "size": 200,
  "_source": ["db_id"],
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "user"
          }
        },
        {
          "has_child": {
            "type": "followers",
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "user_id": "u_18368"
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
  "sort": [
    {
      "_geo_distance": {
        "location": [
          74.34,
          31.54
        ],
        "order": "asc",
        "unit": "km"
      }
    },
    {
      "updated_at": "desc"
    }
  ]
}