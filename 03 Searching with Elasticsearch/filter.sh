curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
   "query":{
   		"bool":{
   			"must":{
   				"match":{"genre":"Sci-Fi"}
   			},
   			"must_not":{
   				"match":{"title":"trek"}
   			},
   			"filter":{
   				"range":{
   					"year":{"gte":1924,"lt":2015}
   				}
   			}
   		}
   },
   "sort": [
   		{
   			"year":{"order":"desc"},
   			"title.raw":{"order":"asc"}
   		}
   	]

}'


