#delete box from posts in search and update operation

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
    },
    "script_fields":{
        "update_boxes": {
            "script": {
                "lang": "painless",
                "params":{
                    "new_name": "Latest 1",
                    "box_id": 36261
                },
                "source": "List x=params._source.boxes;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){x.remove(i);}}return x;"
            }
        }
    }
}


POST posts/post/_update_by_query?refresh
{
    "conflicts": "proceed",
    "script": {
        "source": "List x=ctx._source.boxes;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){x.remove(i);}}ctx._source.boxes=x;",
        "lang": "painless",
        "params": {
            "user_id":18368,
            "new_name": "Latest 2",
            "box_id": 36261
        }
    },
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


#delete post by box_id if boxes count == 0


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
                    "script": {
                        "script": {
                            "source": "try{if(params._source.boxes.size()==1){return params._source.boxes.get(0).id.equals(params.box_id);}else{return false;}}catch(NullPointerException e){return false}",
                            "params": {
                                "box_id": 33721
                            }
                        }
                    }
                }
            ]
        }
    }
}