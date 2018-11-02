curl -XDELETE -H 'Content-Type: application/json'  'http://localhost:9200/user-places'
curl -XPUT "http://localhost:9200/user-places" -H 'Content-Type: application/json' -d'
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
                "pin": {
                    "properties": {
                        "location": {
                            "type": "geo_point"
                        }
                    }
                },
                "key_pin": {
                    "properties": {
                        "location": {
                            "type": "geo_point"
                        }
                    }
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
                },
                "indexed_at": {
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