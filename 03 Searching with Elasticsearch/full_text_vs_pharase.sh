curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
  {
  	 "query":{
  	 	"match_phrase":{"title":"star wars"}
  	 }
  }

'

curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
  {
  	 "query":{
  	 	"match_phrase":{
  	 		"title":{
  	 			"query": "star beyond","slop":1	
  	 		}
  	 	}
  	 }
  }

'

curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
  {
  	 "query":{
  	 	"match_phrase":{
  	 		"title":{
  	 			"query": "star wars","slop":1	
  	 		}
  	 	}
  	 }
  }

'

curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
  {
  	 "query":{
  	 	"match_phrase":{
  	 		"title":{
  	 			"query": "star beyond","slop":100	
  	 		}
  	 	}
  	 }
  }

'

curl -XGET 'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com'