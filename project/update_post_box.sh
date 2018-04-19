POST posts/post/_update_by_query?conflicts=proceed
{
        "conflicts": "proceed",
        "script": {
            "source": "List x=ctx._source.boxes;for(int i=0;i<x.size();i++){x.get(i).post_id=ctx._source.id;}
ctx._source.boxes=x;",
            "lang": "painless",
        },
        "query": {
            "bool": {
                "must": [
                    {
                        "term": {
                            "user_id": 5
                        }
                    }
                ]
            }
        }
}

POST posts/post/_update_by_query?conflicts=proceed
{
  "conflicts": "proceed",
  "script": {
    "source": "List x=ctx._source.boxes;for(int i=0;i<x.size();i++){x.get(i).post_id=ctx._source.id;}ctx._source.boxes=x;",
    "lang": "painless"
  },
  "query": {
    "bool": {
      "must_not": [
        {
          "exists": {
            "field": "box.post_id"
          }
        }
      ],
      "must": [
        {
          "term": {
            "user_id": 5
          }
        }
      ]
    }
  }
}