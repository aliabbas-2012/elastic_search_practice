curl -XDELETE -H 'Content-Type: application/json'  'http://localhost:9200/user-trending'
curl -X PUT "localhost:9200/user-trending" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "max_result_window": 5000000
    }
  },
  "mappings": {
    "doc": {
      "properties": {
        "id": {
          "type": "integer",
          "index": true
        },
 
        "user_id": {
          "type": "integer",
          "index": true
        },
        "key": {
          "type": "keyword",
          "index": true
        },
        "sent": {
          "type": "keyword",
          "index": true
        },
        "created_at": {
          "type": "date",
          "fields": {
            "raw": {
              "type": "keyword",
              "index": false
            }
          }
        }
      }
    }
  }
}
'

curl -XGET "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "followings"
          }
        },
        {
          "term": {
            "user_id": "u-33736"
          }
        }
      ]
    }
  }
}'

curl -XGET "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/user-trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
       "size": 40,
       "query": {
           "bool": {
               "must": [
                   {
                       "term": {
                           "user_id": 30
                       }
                   },
                   {
                       "term": {
                           "key": "9e143aa3-d699-11e8-82e6-06b0cb6c60e81542709663254.8"
                       }
                   },
                   {
                       "term": {
                           "type": "post"
                       }
                   }
               ],
               "must_not": [
                   {
                       "term": {
                           "sent": "9e76c314-d699-11e8-82e6-06b0cb6c60e81542638881368.32"
                       }
                   }
               ]
           }
       }
}'

curl -XGET "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/user-trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size": 100,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "user_id": 30
          }
        },
        {
          "term": {
            "key": "9e143aa3-d699-11e8-82e6-06b0cb6c60e81542710103620.91"
          }
        }
      ],
       "must_not": [
   
        {
          "term": {
            "sent": "9e143aa3-d699-11e8-82e6-06b0cb6c60e81542710103620.91"
          }
        }
      ]
    }
  },
  "sort": [
    {
      "created_at": {
        "order": "desc"
      }
    }
  ]
}
'

curl -XGET "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/user-trending/doc/_count?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "user_id": 30
          }
        },
        {
          "term": {
            "key": "9e143aa3-d699-11e8-82e6-06b0cb6c60e81542710103620.91"
          }
        }
      ],
       "must_not": [
        {
          "term": {
            "sent": "9e143aa3-d699-11e8-82e6-06b0cb6c60e81542710103620.91"
          }
        }
      ]
    }
  },
  "sort": [
    {
      "created_at": {
        "order": "desc"
      }
    }
  ]
}
'

curl -XGET "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/user-trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size": 10,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "user_id": 30
          }
        },
        {
          "term":{
            "id":228077
          }
        }
      ]
    }
  },
  "sort": [
    {
      "created_at": {
        "order": "desc"
      }
    }
  ]
}'


curl -XGET "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size": 10,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "views"
          }
        },
        {
          "term": {
            "user_id": "u-30"
          }
        },
        {
          "term": {
            "object_id": 226982
          }
        }
      ]
    }
  }
}'

curl -XGET "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/trending/doc/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size": 10,
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "views"
          }
        }
        
     
      ]
    }
  }
}'

curl -XGET "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/trending/doc/_count?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "type": "views"
          }
        },
        {
          "term": {
            "user_id": "u-30"
          }
        }
      ]
    }
  }
}'