#group by count
POST /posts/_search?size=0
{
    "aggs" : {
        "group_by_state" : {
            "terms" : {
                "script" : {
                    "source" : "doc['user_id']"
                }
            }
        }
    }
}

POST /posts/_search?size=0
{
    "aggs" : {
        "group_by_state" : {
            "terms" : {
                "script" : "doc.user_id+'-'+doc.user_is_live"
            }
        }
    }
}