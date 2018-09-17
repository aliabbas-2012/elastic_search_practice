curl -XDELETE -H 'Content-Type: application/json'  'http://localhost:9200/user-trending'
curl -X PUT "localhost:9200/user-trending" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "max_result_window": 5000000
    }
  },
  "mappings": {
    "user": {
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
