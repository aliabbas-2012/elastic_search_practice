curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
  {
  	 "query":{
  	 	"match":{"title":"star wars"}
  	 }
  }

'


curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
  "query" : {
	"match": {"title":"star wars"}

   }

}'


curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
  "query" : {
  	"bool":{
  		"must": {"term":{"title":"Star Wars"}}
  	}
   }
}'

curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
  "query" : {
  	"bool":{
  		"must": {"term":{"title":"Star"}},
  		"filter":{"range":{"year": {"gte":2010}}}
  	}
   }
}'


curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '

  {
  	"query":{
  		"match":{
  			"title":"star"
  		}
  	}
  }
' 


curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '

  {
  	"query":{
  		"match":{
  			"title":"star"
  		}
  	}
  }
' 
