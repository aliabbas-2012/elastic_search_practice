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
