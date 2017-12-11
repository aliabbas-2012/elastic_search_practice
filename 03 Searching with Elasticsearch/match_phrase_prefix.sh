curl -XGET -H 'Content-Type: application/json' '127.0.0.1:9200/movies/movie/_search?pretty' -d '
{
   "query":{
         "match_phrase_prefix":{
            "title": {
            	"query":"star trek",
            	"slop":10
            }
            
         }
   }
}'

# N-GRAMS

#New mapping

curl -XDELETE 127.0.0.1:9200/movies/

#Custom analyzer

curl -XPUT  127.0.0.1:9200/movies -d '
{
   "settings":{
   		"analysis": {
   			"filter": {
   				"autocomplete_filter":{
   					"type":"edge_ngram",
   					"min_gram":1,
   					"max_gram":20
   				}
   			},
   			"analyzer":{
   				"autocomplete":{
   					"type":"custom",
   					"tokenizer":"standard",
   					"filter":[
   						"lowercase",
   						"autocomplete_filter"
   					]
   				}
   			}
   		}
   }
} '

#Verify analyzer
curl -XGET '127.0.0.1:9200/movies/_analyze/?analyzer=autocomplete&pretty' -d 'Sta'

#New mapping

curl -XPUT  127.0.0.1:9200/movies -d '
{ 
     "mappings": {
         "movie":  {
           "_all":{"enabled": false },
           "properties": { 
				"id" :  {"type": "integer"},
				"genre": {"type": "string","index": "not_analyzed"},
                "title":{
            		"type": "string",
            		"analyzer": "autocomplete",
            		"fields":{
            			"raw":{
            				"type":"string",
            				"index": "not_analyzed"
            			}
            		}
            	},
				"year": { 
						"type": "date",
						"fields":{
                			"raw":{
                				"type":"string",
                				"index": "not_analyzed"
                			}
            			}	
				}
			}
        }
    }
   
} '
#NEW Mapping right
curl -XPUT  '127.0.0.1:9200/movies/_mapping/movie?pretty' -d '
{ 
   "properties": { 
				"id" :  {"type": "integer"},
				"genre": {"type": "string","index": "not_analyzed"},
                "title":{
            		"type": "string",
            		"analyzer": "autocomplete",
            		"fields":{
            			"raw":{
            				"type":"string",
            				"index": "not_analyzed"
            			}
            		}
            	},
				"year": { 
						"type": "date",
						"fields":{
                			"raw":{
                				"type":"string",
                				"index": "not_analyzed"
                			}
            			}	
				}
			}
} '


#New Bulk Import
curl -XPUT 127.0.0.1:9200/_bulk?pretty --data-binary @movies.json

#Will give wrong result (one extra)
curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
	{
		"query" :{
			"match":{
				"title": "sta"
			}
		}
	}
'

#Right (Only give two that contains sta at the start)

curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
	{
		"query" :{
			"match":{
				"title": {"query":"sta","analyzer": "standard"}
			}
		}
	}
'

#----------Wrong ------------
curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
	{
		"query" :{
			"match":{
				"title": {"query":"star trek","analyzer": "standard"}
			}
		}
	}
'

curl -XGET -H  'Content-Type: application/json' '127.0.0.1:9200/movies/movie/_search?pretty' -d '
{
   "query":{
         "prefix":{
            "title": "star Trek"
            
         }
   }
}'