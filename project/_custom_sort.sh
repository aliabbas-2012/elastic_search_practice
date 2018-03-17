GET /users/user/_search
{
	"_source": [
		"username",
		"full_name",
		"is_live",
		 "score"
	],
	"query": {
		"bool": {
			"must": [
				{
					"bool": {
						"should": [
							{
								"prefix": {
									"username": "_u"
								}
							},
							{
								"prefix": {
									"username": "fahad"
								}
							}
						]
					}
				},
				{
					"bool": {
						"must": [
							{
								"term": {
									"is_live": 1
								}
							}
						]
					}
				}
			]
		}
	},
	"sort" : {
        "_script" : {
            "type": "number",
            "script" : {
                "lang": "painless",
                "source": "if(params._source['username'].startsWith('_')) { (1035766 * (doc.score.value + 1) ) } else {  doc.score.value } ",
                "params" : {
                    "factor" : 1.1
                }
            },
            "order" : "desc"
        }
    }
}

# GET those whome followings alot
GET /users/user/_search
{
	"_source": [
		"id",
		"username",
		"full_name"
	],
	"script_fields":{
		"total_followings": {
            "script": {
                "lang": "painless",
                "source": "return params._source.followings.length"
            }
        }
	},
	"sort" : {
        "_script" : {
            "type": "number",
            "script" : {
                "lang": "painless",
                "source": "return params._source.followings.length ",
                "params" : {
                    "factor" : 1.1
                }
            },
            "order" : "desc"
        }
    }
}

# GET those whome followers alot
GET /users/user/_search
{
	"_source": [
		"id",
		"username",
		"full_name"
	],
	"script_fields":{
		"total_followers": {
            "script": {
                "lang": "painless",
                "source": "return params._source.followers.length"
            }
        }
	},
	"sort" : {
        "_script" : {
            "type": "number",
            "script" : {
                "lang": "painless",
                "source": "return params._source.followers.length ",
                "params" : {
                    "factor" : 1.1
                }
            },
            "order" : "desc"
        }
    }
}