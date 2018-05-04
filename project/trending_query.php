<?php
{
        "size": 0,
        "_source": false,
        "query": {
            "bool": {
                "must": [
                    {
                        "term": {
                            "type": "post"
                        }
                    },
                    {
                        "has_parent": {
                            "parent_type": "user",
                            "query": {
                                "bool": {
                                    "must": [
                                        {
                                            "term": {
                                                "is_live": true
                                            }
                                        }
                                    ],
                                    "must_not": [
                                        {
                                            "has_child": {
                                                "type": "followers",
                                                "query": {
                                                    "bool": {
                                                        "must": [
                                                            {
                                                                "terms": {
                                                                    "user_id": [
                                                                        prepared_user_id
                                                                    ]
                                                                }
                                                            }
                                                        ]
                                                    }
                                                }
                                            }
                                        },
                                        {
                                            "has_child": {
                                                "type": "block",
                                                "query": {
                                                    "bool": {
                                                        "must": [
                                                            {
                                                                "term": {
                                                                    "blocked_user_id": prepared_user_id
                                                                }
                                                            }
                                                        ]
                                                    }
                                                }
                                            }
                                        },
                                        {
                                            "has_child": {
                                                "type": "blocked",
                                                "query": {
                                                    "bool": {
                                                        "must": [
                                                            {
                                                                "term": {
                                                                    "user_id": prepared_user_id
                                                                }
                                                            }
                                                        ]
                                                    }
                                                }
                                            }
                                        }
                                    ]
                                }
                            }
                        }
                    }
                ],
                "must_not": [
                    {
                        "term": {
                            "user_id": prepared_user_id
                        }
                    },
                    {
                        "terms": {
                            "id": not_in
                        }
                    },
                    {
                        "has_child": {
                            "type": "views",
                            "query": {
                                "bool": {
                                    "must": [
                                        {
                                            "term": {
                                                "user_id": prepared_user_id
                                            }
                                        },
                                        {
                                            "range": {
                                                "created_at": {
                                                    "lte": "now",
                                                    "gte": "now-15d/d"
                                                }
                                            }
                                        }
                                    ]
                                }
                            }
                        }
                    }
                ]
            }
        },
        "sort": [
            {
                "_geo_distance": {
                    "location": [lon, lat],
                    "order": "asc",
                    "unit": "km"
                }
            },
            {
                "score": "desc"
            },
            {
                "created_at": "desc"
            }
        ],
        "aggs": {
            "top_users": {
                "terms": {
                    "field": "user_id",
                    "size": 40,
                    "order": {
                        "location_order": "asc",
                        "created_at_order": "desc"
                    }
                },
                "aggs": {
                    "top_post_hits": {
                        "top_hits": {
                            "sort": [
                                {
                                    "created_at": "desc"
                                }
                            ],
                            "_source": {
                                "includes": [
                                    "id"
                                ]
                            },
                            "size": 1
                        }
                    },
                    "location_order": {
                        "min": {
                            "script": {
                                "source": "return doc['location'].planeDistance(params.lat,params.lon)",
                                "params": {
                                    "lon": lon,
                                    "lat": lat
                                }
                            }
                        }
                    },
                    "created_at_order": {
                        "min": {
                            "script": {
                                "source": "return doc['created_at']"
                            }
                        }
                    }
                }
            }
        }
    }