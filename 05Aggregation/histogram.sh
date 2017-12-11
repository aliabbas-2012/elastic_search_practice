
curl -XGET '127.0.0.1:9200/ratings/rating/_search?size=0&pretty' -d '
{

   "aggs":{
         "whole_ratings":{
            "histogram": {
            	"field":"rating",
               "interval": 1.0
            }
            
      }
   }
}'

# -------------ERROR ---------
#---decade 
curl -XGET '127.0.0.1:9200/movies/movie/_search?size=0&pretty' -d '
{

   "aggs":{
         "release":{
            "histogram": {
               "field":"year.raw",
               "interval": 10
            }
            
      }
   }
}'

curl -XGET '127.0.0.1:9200/movies/movielens-sql/_search?size=0&pretty' -d '
{

   "aggs":{
         "release":{
            "histogram": {
               "field":"releaseDate",
               "interval": 10
            }
            
      }
   }
}'