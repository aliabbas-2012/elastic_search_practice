
POST /posts/post/_search?size=0
{
  "query":{
    "bool":{
      "must":{
        "term":{
          "is_post_location":1
        }
      }
    }
  },  
  "aggs": {
    "top_tags": {
      "terms": {
        "field": "post_location.fs_location_id.keyword",
        "size": 3,
        "order": {
          "top_hit": "asc"
        }
      },
      "aggs": {
        "top_sales_hits": {
          "top_hits": {
            "sort": [
              {
                "_geo_distance": {
                  "post_place_location": [
                    74,
                    31
                  ],
                  "order": "asc",
                  "unit": "km"
                }
              }
            ],
            "_source": {
              "includes": [
                "id","post_location.location_name"
              ]
            },
            "size": 1
          }
        },
        "top_hit": {
          "min": {
            "script": {
              "source": "if(params._source.is_post_location==1){double R=6371;double dLat=Math.toRadians(params._source.post_location.latitude-params.latitude);double dLon=Math.toRadians(params._source.post_location.longitude-params.longitude);double a=Math.sin(dLat/2)*Math.sin(dLat/2)+Math.cos(Math.toRadians(params.latitude))*Math.cos(Math.toRadians(params._source.post_location.latitude))*Math.sin(dLon/2)*Math.sin(dLon/2);double c=2*Math.atan2(Math.sqrt(a),Math.sqrt(1-a));return R*c;}return 55555544;",
              "params":{
                "latitude":31,
                "longitude":74
              }
            }
          }
        }
      }
    }
  }
}

POST /posts/post/_search?size=0
{
  "query":{
    "bool":{
      "must":{
        "term":{
          "is_post_location":1
        }
      }
    }
  },  
  "aggs": {
    "top_tags": {
      "terms": {
        "field": "post_location.fs_location_id.keyword",
        "size": 3,
        "order": {
          "top_hit": "asc"
        }
      },
      "aggs": {
        "top_sales_hits": {
          "top_hits": {
            "sort": [
              {
                "_geo_distance": {
                  "post_place_location": [
                    74,
                    31
                  ],
                  "order": "asc",
                  "unit": "km"
                }
              }
            ],
            "_source": {
              "includes": [
                "id","post_location.location_name"
              ]
            },
            "size": 1
          }
        },
        "top_hit": {
          "min": {
            "script": {
              "source": "if(params._source.is_post_location==1){double R=6371;double dLat=Math.toRadians(params._source.post_location.latitude-params.latitude);double dLon=Math.toRadians(params._source.post_location.longitude-params.longitude);double a=Math.sin(dLat/2)*Math.sin(dLat/2)+Math.cos(Math.toRadians(params.latitude))*Math.cos(Math.toRadians(params._source.post_location.latitude))*Math.sin(dLon/2)*Math.sin(dLon/2);double c=2*Math.atan2(Math.sqrt(a),Math.sqrt(1-a));return R*c;}return 55555544;",
              "params":{
                "latitude":31,
                "longitude":74
              }
            }
          }
        }
      }
    }
  }
}
GET /posts/post/_search
{
    "size": 0,
    "aggs" : {
        "sales_per_month" : {
            "date_histogram" : {
                "field" : "created_at",
                "interval" : "month"
            },
            "aggs": {
                  "total_sales": {
                    "_geo_distance": {
                        "field": "post_place_location"
                  }
              },
                "sales_bucket_sort": {
                    "bucket_sort": {
                        "sort": [
                          {
                            "total_sales":
                              "_geo_distance": {
                                "post_place_location": [
                                  74,
                                  31
                                ],
                                "order": "asc",
                                "unit": "km"
                            } 
                          }
                        ],
                        "size": 3
                    }
                }
            }
        }
    }
}


POST /sales/_search
{
    "size": 0,
    "aggs" : {
        "sales_per_month" : {
            "date_histogram" : {
                "field" : "date",
                "interval" : "month"
            },
            "aggs": {
                "total_sales": 
                  {
                    "_geo_distance": {
                        "field": {
                          "post_place_location": [
                            74,
                            31
                          ],
                        }
                    }
                },
                "sales_bucket_sort": {
                    "bucket_sort": {
                        "sort": [
                          {"total_sales": {"order": "asc"}}
                        ],
                        "size": 3
                    }
                }
            }
        }
    }
}

"total_sales": 
  {
                    "_geo_distance": {
                        "field": {
                          "post_place_location": [
                                  74,
                                  31
                                ],
                        }
                    }
},

GET /posts/_search
{
        '_source': ['post_location.location_id'],
        "query": {
            "bool": {
                "must": [
                    {
                        "term": {
                            "is_post_location": 1
                        }
                    }

                ]
            }
        },
        "size": 1000,
        "sort": [
            {
                "_geo_distance": {
                    "post_place_location": [46.67,24.71],
                    "order": "asc",
                    "unit": "km"
                }
            }
        ]
    }