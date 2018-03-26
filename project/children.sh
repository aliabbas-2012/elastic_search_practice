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

POST posts/_search
{
  "_source" : false,
  "query": {
    
    "nested": {
      "path": "boxes",
      "query": {
        "match": {
          "boxes.name" :{
            "query":"beach"
          }
        }
      },
      "inner_hits": {
        "_source" : false,
        "docvalue_fields" : ["boxes.name.keyword"]
      }
    }
  }
}

# Should filter with has child
GET posts/_search
{
    "query": {
        "bool": {
            "should": [
                {
                    "terms": {
                        "id": [
                            12559677,
                            116143
                        ]
                    }
                },
                {
                    "has_child": {
                        "type": "boxes"
                    }
                }
            ]
        }
    }
}

#Nested query with inner hits

{
    "query": {
        "bool": {
            "must": [
                {
                    "nested": {
                        "path": "boxes",
                        "query": {
                            "match_phrase_prefix": {
                                "boxes.name": {
                                    "query": "fav"
                                }
                            }
                        },
                        "inner_hits": {
                            "_source": false,
                            "docvalue_fields": [
                                "boxes.name.keyword"
                            ]
                        }
                    }
                },
                {
                    "terms": {
                        "id": [
                            12559677,
                            116143
                        ]
                    }
                }
            ],
            "should": [
                {
                    "has_child": {
                        "type": "boxes"
                    }
                }
            ]
        }
    }
}

# Ge search post by box_id (From children)
GET /posts/post/_search
{
    "from": 0,
    "size": 1000,
    "_source": [
        "id",
        "user_id",
        "boxes"
    ],
    "query": {
        "bool": {
            "must": [
                {
                    "term": {
                        "user_id": 18368
                    }
                },
                {
                    "nested": {
                        "path": "boxes",
                        "query": {
                            "bool": {
                                "must": {
                                    "term": {
                                        "boxes.id": 36261
                                    }
                                }
                            }
                        }
                    }
                }
            ]
        }
    }
}