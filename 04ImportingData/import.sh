#Delete

curl -XDELETE 'Content-Type: application/json' 127.0.0.1:9200/movies/

#New mapping

curl -XPUT -H 'Content-Type: application/json' '127.0.0.1:9200/movies' -d '
{ 
     "mappings": {
         "movie":  {
           "_all":{"enabled": false },
           "properties": { 
				"id" :  {"type": "integer"},
				"genre": {"type": "text","index": false},
                "title":{
                		"type": "text",
                		"analyzer": "english",
                		"fields":{
                			"raw":{
                				"type":"keyword",
                				"index": false
                			}
                		}
            		},
				"year": { 
							"type": "date",
							"fields":{
	                			"raw":{
	                				"type":"integer",
	                				"index": false
	                			}
                			}	
						}
			 }
         }
     }
   
} '


#New Bulk Import
curl -XPUT  -H 'Content-Type: application/json' '127.0.0.1:9200/_bulk?pretty' --data-binary @movies.json