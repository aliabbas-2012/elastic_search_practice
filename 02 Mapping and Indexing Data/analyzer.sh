curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty
curl -XGET 127.0.0.1:9200/movies/movie/1924

curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
  "query" : {
	"match": {"genre":"sc"}

   }

}
'

curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
  "query" : {
	"match": {"title":"star wars"}

   }

}
'

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
                                "title": {"type": "string","analyzer": "english"},
				"year": { "type": "date"}
			 }
         }
     }
   
} '


#New Bulk Import
curl -XPUT 127.0.0.1:9200/_bulk?pretty --data-binary @movies.json


curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
  "query" : {
	"match": {"genre":"SCI-FI"}

   }

}
'

curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
  "query" : {
	"match": {"title":"star wars"}

   }

}
'
