curl  -H 'Content-Type: application/json' -XPUT http://localhost:9200/i/ -d' 
{
    "index" : {
    }
}'


curl -H 'Content-Type: application/json' -XPOST http://localhost:9200/i/blog/_mapping -d'
{
    "blog": {
        "properties": {
            "prefix": {
                "type": "text", 
                "analyzer": "default"
            },
            "name": {
                "type": "text", 
                "analyzer": "default"
            },
            "original": {
                "type": "text",
                "analyzer": "default"
            }
        }
    }
}'


curl -XPOST -H 'Content-Type: application/json'  '127.0.0.1:9200/_bulk?pretty' -d '
{ "index":  { "_index": "i", "_type": "blog"}}
{ "prefix": "this is a test", "name": "this is a test", "original": "this is a test"}
{ "index":  { "_index": "i", "_type": "blog"}}
{ "prefix": "this is another test", "name": "this is another test", "original": "this is another test"}
'


curl -XGET -H 'Content-Type: application/json' '127.0.0.1:9200/i/blog/_search?pretty' -d '
{
    "from" : 0,
    "size" : 10,
    "query": {
        "bool": {
            "minimum_should_match": "1",
            "must": [
                {
                    "match": {
                        "name": {
                            "query": "test"
                    }
                },
                {
                    "match": {
                        "name": {
                            "query": "a"
                        }
                    }
                },
                {
                    "match": {
                        "name": {
                            "query": "this"
                        }
                    }
                }
            ]
        }
    }
}
'

GET /users/user/_search
{
	"_source": [
		"username",
		"full_name",
		"is_live"
	],
	"query": {
		"bool": {
			"must": [
				{
					"bool": {
						"should": [
							{
								"prefix": {
									"username": "snx"
								}
							},
							{
								"prefix": {
									"full_name": "snx"
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
									"is_live": 0
								}
							}
						]
					}
				}
			]
		}
	}
}