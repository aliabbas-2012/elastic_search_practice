curl -XGET '127.0.0.1:9200/movies/movie/_search?sort=year&pretty'
curl -XGET '127.0.0.1:9200/movies/movie/_search?sort=year:desc&pretty'

#======Create New mapping to based creating raw field copy of main

#Remove mappings

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
				"year": { "type": "date"}
			 }
         }
     }
   
} '


#New Bulk Import
curl -XPUT 127.0.0.1:9200/_bulk?pretty --data-binary @movies.json


curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
   "sort": [
   		{
   			"year":{"order":"desc"},
   			"title.raw":{"order":"asc"}
   		}
   	]

}'
