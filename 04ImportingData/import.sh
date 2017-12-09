#Delete

curl -XDELETE 127.0.0.1:9200/movies/

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
                		"analyzer": "english",
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


#New Bulk Import
curl -XPUT 127.0.0.1:9200/_bulk?pretty --data-binary @movies.json