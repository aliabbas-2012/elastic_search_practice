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
          "term": {
            "id": "u-14"
          }
        },
        {
          "bool": {
            "must_not": [
              {
                "has_child": {
                  "type": "followers",
                  "inner_hits": {
                    "_source": [
                      "user_id"
                    ]
                  },
                  "query": {
                    "bool": {
                      "must": [
                        {
                          "term": {
                            "user_id": "u-17118"
                          }
                        }
                      ]
                    }
                  }
                }
              }
            ]
          }
        }
      ]
    }
  }
}
GET /trending/doc/_search
{
  "_source": [
    "user_id",
    "object_id"
  ],
  "size": 2000,
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
            "object_id": "u-30"
          }
        },
        {
          "has_parent": {
            "parent_type": "user",
            "inner_hits": {
              "_source": [
                "username"
              ]
            },
            "query": {
              "bool": {
                "must": [
                  {
                    "multi_match": {
                        "analyzer": "standard",
                        "query": "fahad",
                        "type": "phrase_prefix",
                        "fields": ["username", "full_name"],
                        "operator": "or",
                        "minimum_should_match": "100%"
                    }
                  }
                ]
              }
            }
          }
        }
      ]
    }
  }
}