POST users/user/_update_by_query?conflicts=proceed
{
        "conflicts": "proceed",
        "script": {
            "source": "try{ctx._source.boxes.add(params.box);}catch(NullPointerException e){ctx._source.boxes=[];ctx._source.boxes.add(params.box);}
HashSet hs=new HashSet();List xt=ctx._source.tag_keywords;xt.removeIf(Objects::isNull);xt.replaceAll(String::toLowerCase);hs.addAll(xt);hs.add(params.box_name_keyword.toLowerCase());xt.clear();xt.addAll(hs);ctx._source.tag_keywords=xt;
",
            "lang": "painless",
            "params": {
                "user_id": 5,
                "box_name_keyword": "mybox_test",
                "box":{
                    "id":555,
                    "name":"MyBoxTest",
                }
            }
        },
        "query": {
            "bool": {
                "must": [
                    {
                        "term": {
                            "id": 5
                        }
                    }
                ]
            }
        }
}