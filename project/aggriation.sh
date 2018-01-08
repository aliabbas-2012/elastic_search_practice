POST posts/post/_search
{
  "query": {
      "term" : { "is_post_location" : 1 } 
  },
  "aggs": {
      "by_email": { 
        "terms": {
          "field": "post_location.fs_location_id",
          "size": 10,
          "order": { "max_score": "desc" } 
        },
        "aggs": { 
          "by_top_hit": { "top_hits": { "size": 15 } },
          "max_score": { "max": { "lang": "expression", "script": "_score" } }
        }
      }
  }
}

POST posts/post/_search
{
  "query": {
      "term" : { "is_post_location" : 1 } 
  },
  "aggs": {
      "by_email": { 
        "terms": {
          "field": "post_location.fs_location_id",
          "size": 10,
          "order": { "max_score": "desc" } 
        },
        "aggs": { 
          "by_top_hit": { "top_hits": { "size": 15 } },
          "max_score": { "max": { "lang": "expression", "script": "_score" } }
        }
      }
  }
}


POST posts/post/_search
{
 
  "query": {
      "term" : { "is_post_location" : 1 } 
  },
  "size": 0, 
  "aggs":{
    "by_district":{
     
      "terms": {
        "field": "post_location.fs_location_id.keyword",
         "size": 100
      },
      "aggs": {
        "tops": {
          "top_hits": {
            "size": 20
          }
        }
      }
    }
  }
}



# =========working

POST posts/post/_search
{
 
  "query": {
      "term" : { "is_post_location" : 1 } 
  },
  "size": 0, 
  "aggs":{
    "by_district":{
     
      "terms": {
        "field": "post_location.fs_location_id.keyword",
         "size": 100
      },
      "aggs": {
        "tops": {
          "top_hits": {
            "size": 20
          }
        }
      }
    }
  },
  "sort" : [
        {
            "_geo_distance" : {
                "post_created_location" : [74,31],
                "order" : "asc",
                "unit" : "km"
            }
        }
    ]
}
