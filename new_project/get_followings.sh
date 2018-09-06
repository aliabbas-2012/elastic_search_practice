{
  "_source": ["object_id"], 
  "size": 1000, 
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "followings"
          }
        },
        {
          "term": {
            "user_id": "u-5"
          }
        },
        {
          "term": {
            "status": "A"
          }
        }
      ]
    }
  }
}