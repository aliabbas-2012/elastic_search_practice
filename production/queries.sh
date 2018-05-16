#user count
curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/users/_count'

#post count
curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/posts/_count'


http://172.31.15.172:3002/post/index-nearest/?long=74&lat=31&user_id=8625


curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/posts/post/127789'



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

curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/_count' -d '
{ 
   "query": { 
      	"bool":{
      		"must":{
      			"term":{
      				"type":"views"
      			}
      		}
      	}        
    }
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



curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/trending/doc/_search' -d '
{ 
   "query": { 
      	"bool":{
      		"must":{
      			"term":{
      				"id":"fr-329862"
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
