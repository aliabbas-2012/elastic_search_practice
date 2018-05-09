POST users/_update_by_query?conflicts=proceed
{
	"script": {
		"source": "",
		"lang": "painless",
		"params": {
			"follower_id": 18363,
			"following_id": 5,
			"action": 1
		}
	},
	"query": {
		"terms": {
			"id": [
				18363,
				5
			]
		}
	}
}


GET /trending/doc/_search
{
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
            "type": "followings",
            "query": {
              "bool": {
                "must": {
                  "term": {
                    "object_id": "u-19712"
                  }
                }
              }
            }
          }
        }
      ]
    }
  }
}