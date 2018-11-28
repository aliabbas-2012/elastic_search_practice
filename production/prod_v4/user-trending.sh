curl -XDELETE -H 'Content-Type: application/json'  'https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/user-trending'
curl -XPUT "https://vpc-prod-v4-pq6mmy4pp4bvouevmnofq2aiq4.us-west-2.es.amazonaws.com/user-trending" -H 'Content-Type: application/json' -d'
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
                "owner_id": {
                    "type": "integer",
                    "index": true
                },
                "score": {
                    "type": "double",
                    "index": true
                },
                "box_id": {
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
                "type": {
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