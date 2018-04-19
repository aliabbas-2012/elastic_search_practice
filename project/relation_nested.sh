GET series/movie/_search
{
  "_source": [
    "id",
    "title",
    "cast_name",
    "film_to_franchise"
  ],
  "query": {
    "has_parent": {
      "parent_type": "film",
      "inner_hits": {
        "_source": [
          "title",
          "movie_name"
        ]
      },
      "query": {
        "terms": {
              "id": [
                "m1"
              ]
        },
        "has_parent": {
          "parent_type": "franchise",
          "inner_hits": {
            "_source": [
              "title",
              "franchise_name"
            ]
          },
          "query": {
            "bool": {
              "must": {
                "terms": {
                  "id": [
                    "fr1"
                  ]
                }
              }
            }
          }
        }
      }
    }
  }
}
