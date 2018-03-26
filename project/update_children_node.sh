#change box name during search
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
                "source": "List x=params._source.boxes;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){x.get(i).name=params.new_name;}}return x;"
            }
        }
    }
}

#update box name during update
POST posts/post/_update_by_query?refresh
{
    "conflicts": "proceed",
    "script": {
        "source": "List x=ctx._source.boxes;String old_name;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){old_name=x.get(i).name;x.get(i).name=params.new_name;}}ctx._source.boxes=x;HashSet hs=new HashSet();List xt=ctx._source.tag_keywords;xt.removeIf(Objects::isNull);xt.replaceAll(String::toLowerCase);hs.addAll(xt);hs.remove(old_name.toLowerCase());hs.add(params.new_name.toLowerCase());xt.clear();xt.addAll(hs);ctx._source.tag_keywords=xt;",
        "lang": "painless",
        "params": {
            "user_id":18368,
            "new_name": "Latest 1",
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