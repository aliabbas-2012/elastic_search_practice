curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/posts/post/128094?pretty'

curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/users/user/18368?pretty&_source=id,is_live,followings' 


curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/users/user/18368?_source=followings,followers,users_blocked,blocked_users&pretty' 
curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/users/user/9595?_source=followings,followers,users_blocked,blocked_users&pretty' 


curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/posts/post/_search?pretty' -d '
{
  "size":1000,
  "_source": ["id","user_id","user_is_live"],
   "query": { 
      "bool":{
        "must":{
        "term": {
          "user_id": 18368
        }
      } 
    }
  }
}
'
curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/posts/post/_search?pretty' -d '
{
  "size":1000,
  "_source": ["id","user_id","user_is_live"],
   "query": { 
      "bool":{
        "must":{
        "term": {
          "user_id": 2
        }
      } 
    }
  }
}
'

curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/users/user/_search?pretty' -d '
{
  "size":1000,
  "_source": ["id","username","is_live"],
   "query": { 
      "bool":{
        "must":{
        "term": {
          "id": 2
        }
      } 
    }
  }
}
'

curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/posts/_count?pretty' -d '
{
   "query": { 
      "bool":{
        "must":{
        "term": {
          "user_id": 28327
        }
      } 
    }
  }
}
'

curl -XPUT  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/posts/_settings/' -d '
{ "index" : { "max_result_window" : 5000000 } }
'

curl -XPUT  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/users/_settings/' -d '
{ "index" : { "max_result_window" : 500000 } }
'

# post count

curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/posts/_count?pretty'

curl -XGET  -H 'Content-Type: application/json' 'https://search-staging-node-js-aymjo5evep6xo63f3wvhamc3re.us-west-2.es.amazonaws.com/users/_count?pretty'