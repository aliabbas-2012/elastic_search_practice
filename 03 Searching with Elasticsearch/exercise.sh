
curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
  "query" : {
	  	"bool":{
	  		"must": 
	  			{"match_phrase":{"title":"Star wars"}
	  		},
	  		"filter":{
	  				"range":{
	  					"year": {"gte":2015}
	  				}
	  		}
	  	}
   }
}'


curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
  "query" : {
	  	"bool":{
	  		"must": 
	  			{"match_phrase":{"title":"Star wars"}
	  		},
	  		"filter":{
	  				"range":{
	  					"year": {"gt":2015}
	  				}
	  		}
	  	}
   }
}'