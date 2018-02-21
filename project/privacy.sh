#update privacy #------update by script


GET /users/user/_search 
{
  "_source": ["id","is_live"], 
	"query": {
		"bool": {
			"must": {
				"terms": {
					"id": [18368,9595,18363]
				}
			}
		}
	}
}
     
#update users
POST users/_update_by_query?refresh
{
	"conflicts": "proceed",
	"script": {
		"source": " Integer s = params.user_ids.get(ctx._source.id.toString()); if (s!=null){ctx._source.is_live = s; } else {ctx._source.is_live = 0;} ",
		"lang": "painless",
		"params": {
			"user_ids": {"9595": 1, "19368": 0, "18363": 0}
		}
	},
	"query": {
		"terms": {
			"id": [9595,18368,18363]
		}
	}
}    

GET /posts/post/_search 
{
  "size":500,
  "_source": ["id","user_id","user_is_live"], 
	"query": {
		"bool": {
			"must": {
				"terms": {
					"user_id": [18368,9595,18363]
				}
			}
		}
	}
}
#update posts
POST posts/_update_by_query?refresh
{
	"conflicts": "proceed",
	"script": {
		"source": " Integer s = params.user_ids.get(ctx._source.user_id.toString()); if (s!=null){ctx._source.user_is_live = s; } else {ctx._source.user_is_live = 0;} ",
		"lang": "painless",
		"params": {
			"user_ids": {"9595": 1, "19368": 0, "18363": 0}
		}
	},
	"query": {
		"terms": {
			"user_id": [9595,18368,18363]
		}
	}
} 