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