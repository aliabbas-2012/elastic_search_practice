#block user
POST users/_update_by_query?refresh
{
	"conflicts": "proceed",
	"script": {
		"source": "HashSet hs1=new HashSet();HashSet hs2=new HashSet();HashSet hs3=new HashSet();if(ctx._source.id==params.user_id){switch(params.action){case 1:List x1=ctx._source.followings;hs1.addAll(x1);hs1.remove(params.block_user_id);x1.clear();x1.addAll(hs1);ctx._source.followings=x1;List x2=ctx._source.followers;hs2.addAll(x2);hs2.remove(params.block_user_id);x2.clear();x2.addAll(hs2);ctx._source.followers=x2;List x3=ctx._source.blocked_users;x3.add(params.block_user_id);hs3.addAll(x3);x3.clear();x3.addAll(hs3);ctx._source.blocked_users=x3;break;case 0:List x1=ctx._source.blocked_users;hs1.addAll(x1);hs1.remove(params.block_user_id);x1.clear();x1.addAll(hs1);ctx._source.blocked_users=x1;break;default:break}}else if(ctx._source.id==params.block_user_id){switch(params.action){case 1:List x1=ctx._source.followings;hs1.addAll(x1);hs1.remove(params.user_id);x1.clear();x1.addAll(hs1);ctx._source.followings=x1;List x2=ctx._source.followers;hs2.addAll(x2);hs2.remove(params.user_id);x2.clear();x2.addAll(hs2);ctx._source.followers=x2;List x3=ctx._source.users_blocked;x3.add(params.user_id);hs3.addAll(x3);x3.clear();x3.addAll(hs3);ctx._source.users_blocked=x3;break;case 0:List x1=ctx._source.users_blocked;hs1.addAll(x1);hs1.remove(params.user_id);x1.clear();x1.addAll(hs1);ctx._source.users_blocked=x1;break;default:break}}",
		"lang": "painless",
		"params": {
			"user_id": 18368,
			"block_user_id": 9595,
			"action": 1
		}
	},
	"query": {
		"terms": {
			"id": [9595,18368]
		}
	}
}    

#Test
GET /users/user/18368?_source=followings,followers
GET /users/user/9595?_source=followings,followers