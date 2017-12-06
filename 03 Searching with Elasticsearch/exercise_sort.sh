curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
   "query":{
   		"bool":{
   			"must":{
   				"match":{"genre":"Sci-Fi"}
   			},
   			"filter":{
   				"range":{
   					"year":{"lte":1960}
   				}
   			}
   		}
   },
   "sort": [
   		{
   			"title.raw":{"order":"asc"}
   		}
   	]

}'


#OR 

curl -XGET '127.0.0.1:9200/movies/movie/_search?sort=title.raw:asc&pretty' -d '
{
   "query":{
         "bool":{
            "must":{
               "match":{"genre":"Sci-Fi"}
            },
            "filter":{
               "range":{
                  "year":{"lte":1960}
               }
            }
         }
   }
}'