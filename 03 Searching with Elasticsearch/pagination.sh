curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
   "from": 0,
   "size": 2,
   "query": {
   		"match":{"genre":"Sci-Fi"}
	}
}'

curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
   "from": 2,
   "size": 2,
   "query": {
   		"match":{"genre":"Sci-Fi"}
	}
}'


curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty -d '
{
   "from": 4,
   "size": 2,
   "query": {
   		"match":{"genre":"Sci-Fi"}
	}
}'
