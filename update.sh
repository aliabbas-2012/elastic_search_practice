curl -XPOST 127.0.0.1:9200/movies/movie/1924/_update -d '
{

  "doc": {
  	"title": "Interest" 
  }
} '

curl -XPOST 127.0.0.1:9200/movies/movie/1/_update -d '
{

  "doc": {
  	"title": "My First Movie" 
  }
} '


curl -XPOST 127.0.0.1:9200/movies/movie/1924/_update -d '
{
  "doc" : {
	"title": "My 2nd movie name"
    
  }
  
}'


