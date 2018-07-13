#Added in Local only 
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "box_posts": {
      "type": "nested",
      "properties": {
            "id": {
              "type": "integer",
              "index": true
            },
            "box_id": {
              "type": "integer",
              "index": true
            },
            "place": {
              "type": "geo_point",
              "index": true
            },
            "location": {
              "dynamic": true,
              "properties": {}
            },
            "text_content": {
              "type": "text",
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
            },
            "post_media": {
                "dynamic": true,
                "properties": {}
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
    "box_user": {
      "type": "nested",
      "properties": {
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
}
'

