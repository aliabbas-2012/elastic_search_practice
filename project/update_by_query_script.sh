GET /posts/post/_update_by_query
{
    "script": {
      "source": "ctx._source[params.field_name] = params.default_value;",
      "lang": "painless",
      "params": {
        "field_name": "is_testq",
        "default_value": false
      }
    },
    "query": {
        "bool" : {
            "must" : {
                "script" : {
                    "script" : {
                        "source" : "return params._source['followings'].contains(params.user_id); ",
                        "lang"   : "painless",
                        "params" : {
                            "user_id" : 5
                        }
                    }
                }
            }
        }
    }
}