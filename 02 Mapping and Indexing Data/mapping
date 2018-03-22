curl -XPUT  127.0.0.1:9200/movies -d '
{ 
     "mappings": {
         "movie":  {
           "_all":{"enabled": false },
           "properties": { 
				"year": { "type": "date"}
			 }
         }
     }
   
} '



curl -XGET 127.0.0.1:9200/movies/_mapping
