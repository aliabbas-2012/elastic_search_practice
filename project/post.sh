# Select * from users where user_id IN (5,14)
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
# Select * from users where user_id IN (5,14) AND is_post_location = 1 AND usre_is_live = 1 
GET posts/_search
{  
   "query":{  
      "bool":{  
         "must":[  
            {  
               "term":{  
                  "is_post_location":1
               }
            },
            {  
               "terms":{  
                  "user_is_live":1
               }
            },
            {  
               "terms":{  
                  "user_id":[  
                     5,
                     14
                  ]
               }
            }
         ]
      }
   }
}

# Select * from users where user_id NOT IN (5,14) AND is_post_location = 1 AND usre_is_live = 1 
GET posts/post/_search
{  
   "query":{  
      "bool":{  
         "must":[  
            {  
               "term":{  
                  "is_post_location":1
               }
            },
            {  
               "term":{  
                  "user_is_live":1
               }
            }
         ],
         "must_not":[  
            {  
               "terms":{  
                  "user_id":[  
                     5,
                     14,
                     8625
                  ]
               }
            }
         ]
      }
   }
}