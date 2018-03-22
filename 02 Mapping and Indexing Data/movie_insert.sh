curl -XPUT 127.0.0.1:9200/movies/movie/1 -d '
{
   "genere": ["IMAX","SC"],
   "title": "First Movie",
   "year": 1992
  
} '


#------------BULK INSERT---------------#

curl -XPUT 127.0.0.1:9200/_bulk -d '
{
   "create": { "_index": "movies", "type: "movie", "_id": "16444"},
   { "id": "16444", "title": "Start Trek Byond": "year": 2016, "genre": ["Action","Adventure","Sci-Fi"] }

  
} '


curl -XPUT 127.0.0.1:9200/_bulk?pretty --data-binary @movies.json


#INSERT SINGLE

curl -XPUT 127.0.0.1:9200/movies/movie/1924 -d '
{
  "genere": ["HI","DD"],
  "title": "My 2nd movie",
  "year" : 1985

} '

