
HashSet hs = new HashSet();
if (ctx._source.id == params.follower_id){
	List x = ctx._source.followings;
	HashSet hs = new HashSet();
	if(params.action == 1){
		x.add(params.following_id);
		hs.addAll(x);
	}
	else {
		hs.addAll(x);
		hs.values().remove(params.following_id);
	}
	x.clear();
	x.addAll(hs);
	ctx._source.followings = x;
}
else if (ctx._source.id == params.following_id){
	List x = ctx._source.followers;
	HashSet hs = new HashSet();
	if(params.action == 1){
		x.add(params.follower_id);
		hs.addAll(x);
	}
	else {
		hs.addAll(x);
		hs.values().remove(params.follower_id);
	}
	x.clear();
	x.addAll(hs);
	ctx._source.followers = x;
}
