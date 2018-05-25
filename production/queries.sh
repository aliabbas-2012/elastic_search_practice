#user count
curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/users/_count'

#post count
curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/posts/_count'


http://172.31.15.172:3002/post/index-nearest/?long=74&lat=31&user_id=8625

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/users/user/18368?pretty'
curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/posts/post/183022?pretty'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/posts/post/182395?pretty'

curl -XGET -H 'Content-Type: application/json'  'https://search-staging-node-v2-4-5zns7u6jcfgr4ohsvds54etdhu.us-west-2.es.amazonaws.com/_search'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/_count'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/_count'


curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty' -d '
{ 
   "query": { 
      	"bool":{
      		"must":[
      			{
      				"term":{
      					"type":"user"
      				}
      			},
      			{
      				"term":{
      					"id":"u-18368"
      				}
      			}
      		]
      	}        
    }
} 
'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty' -d '
{ 
   "query": { 
      	"bool":{
      		"must":[
      			{
      				"term":{
      					"type":"post"
      				}
      			},
      			{
      				"term":{
      					"id":"p-183022"
      				}
      			}
      		]
      	}        
    }
} 
'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty' -d '
{ 
   "query": { 
      	"bool":{
      		"must":[
      			{
      				"term":{
      					"type":"post"
      				}
      			}
      		]
      	}        
    },
    "sort":[
     {
      "db_id": "desc"
     }
  ]
} 
'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/_search?pretty' -d '
{ 
   "size":4,
   "query": { 
      	"bool":{
      		"must":[
      			{
      				"term":{
      					"type":"views"
      				}
      			},
      			{
      				"term":{
      					"user_id":"u-18368"
      				}
      			}
      		]
      	}        
    },
    "sort":[
     	{
      		"created_at": "desc"
    	}
    ]
} 
'
curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/_search?pretty' -d '
{ 
   "size":4,
   "query": { 
      	"bool":{
      		"must":[
      			{
      				"term":{
      					"type":"views"
      				}
      			},
      			{
      				"term":{
      					"user_id":"u-18368"
      				}
      			},
      			{
      				"term":{
      					"object_id":"p-174401"
      				}
      			}
      		]
      	}        
    },
    "sort":[
     	{
      		"db_id": "desc"
    	}
    ]
} 
'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/_count' -d '
{ 
   "query": { 
      	"bool":{
      		"must":{
      			"term":{
      				"type":"likes"
      			}
      		}
      	}        
    }
} 
'

assets/profile_images/original/


curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/users/user/18368'



curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty' -d '
{ 
   "query": { 
      	"bool":{
      		"must":{
      			"term":{
      				"id":"fr-337135"
      			}
      		}
      	}        
    }
} 
'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty' -d '
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
																"term": {
																	"user_id": "u-31981"
																}
															}
														]
													}
												}
											}
										},
										{
											"has_child": {
												"type": "followings",
												"query": {
													"bool": {
														"must": [
															{
																"term": {
																	"user_id": "u-31981"
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
							"user_id": "u-31981"
						}
					},
					{
						"terms": {
							"user_id": []
						}
					},
					{
						"terms": {
							"db_id": [
			
	
							]
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
												"user_id": "u-31981"
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
		"aggs": {
			"top_users": {
				"terms": {
					"field": "user_id",
					"size": 10,
					"order": {
						"score_order": "desc",
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
								"source": "return doc.location.planeDistance(params.lat,params.lon)",
								"params": {
									"lon": 74.32,
									"lat": 31.56
								}
							}
						}
					},
					"created_at_order": {
						"max": {
							"field": "created_at"
						}
					},
					"score_order": {
						"max": {
							"field": "score"
						}
					}
				}
			}
		}
	}

} 
'
curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty' -d '
{ 
   "query": { 
      	"bool":{
      		"must":[
      			{
      				"term":{
      					"id":"u-31497"
      				}
      			},
      			{
      				"term":{
      					"type":"user"
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
																"term": {
																	"user_id": "u-31981"
																}
															}
														]
													}
												}
											}
										},
										{
											"has_child": {
												"type": "followings",
												"query": {
													"bool": {
														"must": [
															{
																"term": {
																	"user_id": "u-31981"
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
'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search?pretty' -d '
{
	"_source": [
		"user_id",
		"object_id"
	],
	"from": 0,
	"size": 20,
	"sort": [],
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
						"object_id": "u-29199"
					}
				}
			],
			"must_not": {
				"terms": {
					"user_id": [
						"u-2752",
						"u-3607",
						"u-8320",
						"u-2985",
						"u-9429",
						"u-6999",
						"u-2297",
						"u-17569",
						"u-6216",
						"u-3984",
						"u-19283",
						"u-11807",
						"u-8526",
						"u-9244",
						"u-4005",
						"u-9060",
						"u-4037",
						"u-9595",
						"u-27152",
						"u-18368"
					]
				}
			}
		}
	}
}
'

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/posts/post/_search?pretty' -d '
{
	"_source": false,
	"size": 0,
	"query": {
		"bool": {
			"must": {
				"term": {
					"user_id":  30 
				}
			}
		}
	},
	"aggs": {
		"boxes": {
			"nested": {
				"path": "boxes"
			},
			"aggs": {
				"my_boxes": {
					"terms": {
						"field": "boxes.id",
						"size": 5
					},
					"aggs": {
						"tops": {
							"top_hits": {
								"size": 4,
								"_source": [
									"boxes.post_id",
									"boxes.id"
								],
								"sort": [
									{
										"boxes.post_id": {
											"order": "desc"
										}
									}
								]
							}
						}
					}
				}
			}
		}
	}
}
'