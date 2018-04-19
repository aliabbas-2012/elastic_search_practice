curl -XPUT 127.0.0.1:9200/series -d '
 {
	"mappings": {
        "franchise": {},
        "film": {
		   "_parent": {"type": "franchise"} 
		}
	}        
 }    '
curl -XPUT 127.0.0.1:9200/series -d '

		"movie": {
			"properties": {
				"film_to_franchise":{
					"type":"join",
					"relations":{
						"franchise":"film"
					}
				},
		        "id": { "type": "integer" },
		        "name": { "type": "text", "index": true }
	    	}
		}
	}
}
'


#NOW BULK Import

curl -XPUT 127.0.0.1:9200/_bulk/?pretty --data-binary @series.json

#Now query

curl -XGET 127.0.0.1:9200/series/film/_search?pretty -d '
{
	"query": {
		"has_parent": {
			"type": "franchise",
			"query": {
				"match": {
					"title": "Star wars"
				}
			}
		}
	}
}
'

curl -XGET 127.0.0.1:9200/series/film/_search?pretty -d ' 
 {
	"query": {
		"has_child": {
			"type": "film",
			"query": {
				"match": {
					"title": "The Force Awakens"
				}
			}
		}
	}
}
'

