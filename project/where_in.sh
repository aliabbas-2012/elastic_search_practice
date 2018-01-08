GET posts/_search
{
  "size":1000,
   "query": {
        "constant_score" : {
            "must_not":{
            "filter" : {
                "terms" : { "user_id" : [5,14]}
            }
            }
        }
    }
}