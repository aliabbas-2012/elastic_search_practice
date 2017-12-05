curl -XGET 127.0.0.1:9200/movies/movie/1?version=4 


curl -XGET 127.0.0.1:9200/movies/movie/1?version=4 -d '
{
  "genere": ["IMAX","SCI-D"],
  "title": "Interesslt fee",
   "year": 2014
}'

curl -XPOST 127.0.0.1:9200/movies/movie/1/_update?retry_on_conflict=5 -d '

  {
       "doc": {"title": "Intestre"}
  }

'
