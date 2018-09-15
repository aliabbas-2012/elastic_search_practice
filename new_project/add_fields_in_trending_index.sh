#Added in Local only 
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "box_posts": {
      "type": "nested",
      "properties":{
          "id": {
            "type": "integer",
            "index": true
          },
          "box_id": {
            "type": "integer",
            "index": true
          },
          "user_id": {
            "type": "integer",
            "index": true
          },
          "text_content": {
            "type": "text",
            "index": true,
            "analyzer": "autocomplete",
            "fields": {
                "raw": {
                    "type": "keyword",
                    "index": false
                }
            }
          },
          "post_media": {
            "dynamic": true,
            "properties": {

            }
          },
          "location": {
            "dynamic": true,
            "properties": {

            }
          },
          "place":{
            "type": "geo_point",
            "index": true
          },
          "user_id": {
            "type": "integer",
            "index": true
          },
          "created_location": {
            "type": "geo_point"
          },
          "score": {
            "type": "integer",
            "index": true
          }
        }
    },
    "box_user": {
      "type": "nested",
      "properties":{
          "id": {
            "type": "integer",
            "index": true
          },
          "box_id": {
            "type": "integer",
            "index": true
          },
          "username": {
            "type": "text",
            "index": true,
            "analyzer": "autocomplete",
            "fields": {
                "raw": {
                    "type": "keyword",
                    "index": false
                }
            }
          },
          "full_name": {
            "type": "text",
            "index": true,
            "analyzer": "autocomplete",
            "fields": {
                "raw": {
                    "type": "keyword",
                    "index": false
                }
            }
          },
          "is_private": {
            "type": "boolean",
            "index": true
          }
          
      }
    }
  }
}
'
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "status": {
      "type": "keyword",
      "index": true
    }
  }
}
'
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "uid": {
      "type": "keyword",
       "index": true
    }
  }
}

'
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "picture": {
      "type": "text",
       "index": true
    }
  }
}

'
# add user_id in box_posts
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "box_posts": {
      "type": "nested",
      "properties": {
            "user_id": {
              "type": "integer",
              "index": true
            },
            "created_location": {
              "type": "geo_point"
            }
        }
      }
    }
  }
}
'
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "box_posts": {
      "type": "nested",
      "properties": {
            "score": {
              "type": "integer",
              "index": true
            }
        }
      }
    }
  }
}
'


curl -XPUT "http://localhost:9200/trending/_doc/_mapping" -H 'Content-Type: application/json' -d'
{

      "properties": {
        "type": {
            "type": "join",
            "relations": {
                "user": [
                    "post",
                    "user_likes",
                    "box",
                    "notifications",
                    "messages",
                    "followings",
                    "followers",
                    "blocked",
                    "block",
                    "user_views",
                    "friend_requests"
                ],
                "post": ["views", "likes", "comments", "post_box", "place", "media"],
                "box": ["posts"]

            }
        }
      }
    
  
}'