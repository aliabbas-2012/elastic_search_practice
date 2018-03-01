POST users/_update_by_query?conflicts=proceed
{
	"script": {
		"source": "",
		"lang": "painless",
		"params": {
			"follower_id": 18363,
			"following_id": 5,
			"action": 1
		}
	},
	"query": {
		"terms": {
			"id": [
				18363,
				5
			]
		}
	}
}


POST users/_update_by_query?refresh
{
	"conflicts": "proceed",
	"script": {
		"source": "HashSet hs=new HashSet();if(ctx._source.id==params.follower_id){List x=ctx._source.followings;if(params.action==1){x.add(params.following_id);hs.addAll(x)}else{hs.addAll(x);hs.remove(params.following_id)}x.clear();x.addAll(hs);ctx._source.followings=x}else if(ctx._source.id==params.following_id){List x=ctx._source.followers;if(params.action==1){x.add(params.follower_id);hs.addAll(x)}else{hs.addAll(x);hs.remove(params.follower_id)}x.clear();x.addAll(hs);ctx._source.followers=x}",
		"lang": "painless",
		"params": {
			"follower_id": 18363,
			"following_id": 9595,
			"action":1
		}
	},
	"query": {
		"terms": {
			"id": [9595,18363]
		}
	}
}    

POST users/_update_by_query?refresh
{
	"conflicts": "proceed",
	"script": {
		"source": "HashSet hs=new HashSet();if(ctx._source.id==params.user_id){List x=ctx._source.followings;if(params.action==1){x.add(params.following_id);hs.addAll(x)}else{hs.addAll(x);hs.remove(params.following_id)}x.clear();x.addAll(hs);ctx._source.followings=x}else if(ctx._source.id==params.following_id){List x=ctx._source.followers;if(params.action==1){x.add(params.follower_id);hs.addAll(x)}else{hs.addAll(x);hs.remove(params.follower_id)}x.clear();x.addAll(hs);ctx._source.followers=x}",
		"lang": "painless",
		"params": {
			"user_id": 18363,
			"block_user_id": 9595,
			"action":1
		}
	},
	"query": {
		"terms": {
			"id": [9595,18363]
		}
	}
}    
