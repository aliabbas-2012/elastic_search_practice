curl -XGET '127.0.0.1:9200/movies/movie/_search?pretty' -d '
{
   "query":{
         "prefix":{
            "year.raw": 201
            
         }
   }
}'

curl -XGET '127.0.0.1:9200/movies/movie/_search?pretty' -d '
{
   "query":{
         "wildcard":{
            "year.raw": "*1"
            
         }
   }
}'


#Above will generate following error 

#============reason" : "failed to parse date field [*1] with format [strict_date_optional_ti#

#--------Remapping -----------

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


curl -XGET '127.0.0.1:9200/movies/movie/_search?pretty' -d '
{
   "query":{
         "prefix":{
            "year.raw": 201
            
         }
   }
}'

curl -XGET '127.0.0.1:9200/movies/movie/_search?pretty' -d '
{
   "query":{
         "wildcard":{
            "year.raw": "*1*"
            
         }
   }
}'