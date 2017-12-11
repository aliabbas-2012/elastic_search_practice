#----------Wrong spell----------------------
curl -XGET -H 'Content-Type: application/json' '127.0.0.1:9200/movies/movie/_search?pretty' -d '
{
   "query":{
         "match":{
            "title": "Intersteller"
            
         }
   }
}'


curl -XGET  -H 'Content-Type: application/json' '127.0.0.1:9200/movies/movie/_search?pretty&sort=title.raw:asc' -d '
{
   "query":{
         "fuzzy":{
            "title.raw": {"value": "Intersteller", "fuzziness": 1 }
         }
   }
}'

# Sustitution

curl -XGET -H 'Content-Type: application/json' '127.0.0.1:9200/movies/movie/_search?pretty&sort=title.raw:asc' -d '
{
   "query":{
         "fuzzy":{
            "title.raw": {"value": "Intursteller", "fuzziness": 2}
         }
   }
}'
#Subtraction
curl -XGET -H 'Content-Type: application/json' '127.0.0.1:9200/movies/movie/_search?pretty&sort=title.raw:asc' -d '
{
   "query":{
         "fuzzy":{
            "title.raw": {"value": "Intrsteller", "fuzziness": 2}
         }
   }
}'

#Addition

curl -XGET -H 'Content-Type: application/json' '127.0.0.1:9200/movies/movie/_search?pretty&sort=title.raw:asc' -d '
{
   "query":{
         "fuzzy":{
            "title.raw": {"value": "Interstellerr", "fuzziness": 3}
         }
   }
}'

#example
curl -XGET '127.0.0.1:9200/movies/movie/_search?pretty&sort=title.raw:asc' -d '
{
   "query":{
         "fuzzy":{
            "title": {"value": "wars", "fuzziness": 3}
         }
   }
}'


curl -XGET -H 'Content-Type: application/json' '127.0.0.1:9200/movies/movie/_search?pretty'  -d'
{ "query": {
   "prefix" : { "title" : "ki" }
  }
}
'
