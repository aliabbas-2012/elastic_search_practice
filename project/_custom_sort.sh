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