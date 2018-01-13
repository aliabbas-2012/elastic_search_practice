GET /posts/post/_search
{
    "query": {
        "bool" : {
            "must_not": [
                        {
                            "exists": {
                                "field": "boxes"
                            }
                        }
                    ]
        }
    }
}
POST /posts/post/125596/_update
{
       "doc": {
        	"boxes": []
        }
    
}

GET /posts/post/125596
GET posts/post/_search
GET /posts/post/_search
{
    "query": {
      
        "has_child" : {
            "type" : "boxes"
        }
    }
}


#Nested filters

POST test/_search
{
  "query": {
    "nested": {
      "path": "comments",
      "query": {
        "match_phrase_prefix": {
          "comments.author" :{
            "query":"nik"
          }
        }
      },
      "inner_hits": {
        "_source" : false,
        "docvalue_fields" : ["comments.author.keyword"]
      }
    }
  }
}