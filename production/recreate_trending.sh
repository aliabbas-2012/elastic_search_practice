curl -XDELETE -H 'Content-Type: application/json'  'http://localhost:9200/trending'
curl -XPUT "http://localhost:9200/trending" -H 'Content-Type: application/json' -d'
{
    "settings": {
        "index": {
            "analysis": {
                "filter": {
                    "autocomplete_filter": {
                        "type": "edge_ngram",
                        "min_gram": 1,
                        "max_gram": 20
                    }
                },
                "analyzer": {
                    "autocomplete": {
                        "type": "custom",
                        "tokenizer": "standard",
                        "filter": [
                            "lowercase",
                            "autocomplete_filter"
                        ]
                    },
                    "edge_ngram_analyzer": {
                        "filter": [
                            "lowercase"
                        ],
                        "tokenizer": "edge_ngram_tokenizer"
                    },
                    "edge_ngram_search_analyzer": {
                        "tokenizer": "lowercase"
                    }
                },
                "tokenizer": {
                    "edge_ngram_tokenizer": {
                        "type": "edge_ngram",
                        "min_gram": 1,
                        "max_gram": 20,
                        "token_chars": [
                            "letter",
                            "digit"
                        ]
                    }
                }
            }
        }
    },
    "mappings": {
        "doc": {
            "properties": {
                "id": {
                    "type": "keyword",
                    "index": true
                },
                "db_id": {
                    "type": "long",
                    "index": true
                },
                "uid": {
                    "type": "keyword",
                    "index": true
                },
                "facebook_id": {
                    "type": "keyword",
                    "index": true
                },
                "username": {
                    "type": "text",
                    "index": true,
                    "analyzer": "autocomplete",
                    "search_analyzer": "standard",
                    "fielddata": true,
                    "fields": {
                        "edgengram": {
                            "type": "text",
                            "analyzer": "edge_ngram_analyzer",
                            "search_analyzer": "edge_ngram_search_analyzer"
                        },
                        "raw": {
                            "type": "keyword",
                            "index": true
                        }
                    }
                },
                "full_name": {
                    "type": "text",
                    "index": true,
                    "analyzer": "autocomplete",
                    "search_analyzer": "standard",
                    "fielddata": true,
                    "fields": {
                        "edgengram": {
                            "type": "text",
                            "analyzer": "edge_ngram_analyzer",
                            "search_analyzer": "edge_ngram_search_analyzer"
                        },
                        "raw": {
                            "type": "keyword",
                            "index": true
                        }
                    }
                },
                "name": {
                    "type": "text",
                    "index": true,
                    "analyzer": "autocomplete",
                    "search_analyzer": "standard",
                    "fielddata": true,
                    "fields": {
                        "edgengram": {
                            "type": "text",
                            "analyzer": "edge_ngram_analyzer",
                            "search_analyzer": "edge_ngram_search_analyzer"
                        },
                        "raw": {
                            "type": "keyword",
                            "index": true
                        }
                    }
                },
                "phone": {
                    "type": "text",
                    "index": true,
                    "fields": {
                        "raw": {
                            "type": "keyword",
                            "index": true
                        }
                    }
                },
                "picture": {
                    "type": "text",
                    "index": true
                },
                "uuid": {
                    "type": "keyword",
                    "index": true
                },
                "status": {
                    "type": "keyword"
                },
                "is_live": {
                    "type": "boolean",
                    "index": true
                },
                "message_privacy": {
                    "type": "integer",
                    "index": true
                },
                "country_id": {
                    "type": "integer",
                    "index": true
                },
                "user_id": {
                    "type": "keyword",
                    "index": true
                },
                "object_id": {
                    "type": "keyword",
                    "index": true
                },
                "content": {
                    "type": "text",
                    "index": true
                },
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
                        "user_id": {
                            "type": "integer",
                            "index": true
                        },
                        "post_box_id": {
                            "type": "integer",
                            "index": true
                        },
                        "text_content": {
                            "type": "text",
                            "index": true,
                            "analyzer": "autocomplete",
                            "search_analyzer": "standard",
                            "fielddata": true,
                            "fields": {
                                "edgengram": {
                                    "type": "text",
                                    "analyzer": "edge_ngram_analyzer",
                                    "search_analyzer": "edge_ngram_search_analyzer"
                                },
                                "raw": {
                                    "type": "keyword",
                                    "index": true
                                }
                            }
                        },
                        "post_media": {
                            "dynamic": true,
                            "properties": {}
                        },
                        "location": {
                            "dynamic": true,
                            "properties": {}
                        },
                        "place": {
                            "type": "geo_point",
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
                            "analyzer": "autocomplete",
                            "search_analyzer": "standard",
                            "fielddata": true,
                            "fields": {
                                "edgengram": {
                                    "type": "text",
                                    "analyzer": "edge_ngram_analyzer",
                                    "search_analyzer": "edge_ngram_search_analyzer"
                                },
                                "raw": {
                                    "type": "keyword",
                                    "index": true
                                }
                            }
                        },
                        "full_name": {
                            "type": "text",
                            "index": true,
                            "analyzer": "autocomplete",
                            "search_analyzer": "standard",
                            "fielddata": true,
                            "fields": {
                                "edgengram": {
                                    "type": "text",
                                    "analyzer": "edge_ngram_analyzer",
                                    "search_analyzer": "edge_ngram_search_analyzer"
                                },
                                "raw": {
                                    "type": "keyword",
                                    "index": true
                                }
                            }
                        },
                        "is_private": {
                            "type": "boolean",
                            "index": true
                        }
                    }
                },
                "place": {
                    "dynamic": true,
                    "properties": {}
                },
                "post_location": {
                    "type": "geo_point",
                    "index": true
                },
                "created_location": {
                    "type": "geo_point",
                    "index": true
                },
                "local_db_path": {
                    "type": "keyword",
                    "index": true
                },
                "post_type_id": {
                    "type": "long",
                    "index": true
                },
                "score": {
                    "type": "long"
                },
                "created_at": {
                    "type": "date",
                    "index": true
                },
                "timestamp": {
                    "type": "long",
                    "index": true
                },
                "updated_at": {
                    "type": "date",
                    "index": true
                },
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
                            "user_views"
                        ],
                        "post": [
                            "views",
                            "likes",
                            "comments",
                            "post_box",
                            "place",
                            "media"
                        ],
                        "box": [
                            "posts"
                        ],
                        "posts": [
                            "posts_views"
                        ]
                    }
                }
            }
        }
    }
}'