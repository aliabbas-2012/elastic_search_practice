
POST trending/_update_by_query
{
  "script": {
    "source": " for (int i = 0; i < ctx._source.box_posts.size(); i++) { ctx._source.box_posts.get(i).user_id = ctx._source.box_user.id }",
    "lang": "painless"
  },
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
            "path": "box_user",
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "box_user.id": 5
                    }
                  }
                ]
              }
            }
          }
        },
        {
          "nested": {
            "path": "box_posts",
            "query": {
              "bool": {
                "must": []
              }
            }
          }
        }
      ]
    }
  }
}
