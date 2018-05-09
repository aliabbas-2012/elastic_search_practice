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
  "from": 0,
  "size": 40,
  "_source": [
    "id",
    "username"
  ],
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
      ],
      "filter": {
        "multi_match": {
          "analyzer": "standard",
          "query": "ali",
          "type": "phrase_prefix",
          "fields": [
            "username",
            "full_name"
          ],
          "operator": "or",
          "minimum_should_match": "100%"
        }
      }
    }
  }
}