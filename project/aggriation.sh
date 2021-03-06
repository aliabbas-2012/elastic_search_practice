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
  },

}

POST posts/post/_search
{
 
  "query":{  
      "bool":{  
         "must":[  
            {  
               "terms":{  
                  "post_location.location_id":[  
                     5,
                     14,
                     8625
                  ]
               }
            }
         ]
      }
   }
  "size": 0, 
  "aggs":{
    "by_location":{
     
      "terms": {
        "field": "post_location.location_id",
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

}

#making groups of each location_id
POST posts/post/_search
{
 
  "query":{  
      "bool":{  
         "must":[  
            {  
               "terms":{  
                  "post_location.location_id":[
                     1,
                     5,
                     14,
                     8625
                  ]
               }
            }
         ]
      }
   },
  "size": 0, 
  "aggs":{
    "by_location":{
     
      "terms": {
        "field": "post_location.location_id",
         "size": 100,
         "order" : { "_count" : "asc" }
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