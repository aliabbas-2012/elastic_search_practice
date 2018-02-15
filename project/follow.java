
HashSet hs = new HashSet();
if (ctx._source.id == params.follower_id){
	List x = ctx._source.followings
	if(params.action == 1){
		x.add(params.follower_id)
	}
	else {
		while(x.remove(params.following_id)) {}
	}
}
