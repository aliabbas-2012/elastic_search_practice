
HashSet hs = new HashSet();
if (ctx._source.id == params.follower_id){
	List x = ctx._source.followings;
	if(params.action == 1){
		x.add(params.following_id);
		hs.addAll(x);
	}
	else {
		hs.addAll(x);
		hs.remove(params.following_id);
	}
	x.clear();
	x.addAll(hs);
	ctx._source.followings = x;
}
else if (ctx._source.id == params.following_id){
	List x = ctx._source.followers;
	if(params.action == 1){
		x.add(params.follower_id);
		hs.addAll(x);
	}
	else {
		hs.addAll(x);
		hs.remove(params.follower_id);
	}
	x.clear();
	x.addAll(hs);
	ctx._source.followers = x;
}


HashSet hs=new HashSet();if(ctx._source.id==params.follower_id){List x=ctx._source.followings;if(params.action==1){x.add(params.following_id);hs.addAll(x)}else{hs.addAll(x);hs.remove(params.following_id)}x.clear();x.addAll(hs);ctx._source.followings=x}else if(ctx._source.id==params.following_id){List x=ctx._source.followers;if(params.action==1){x.add(params.follower_id);hs.addAll(x)}else{hs.addAll(x);hs.remove(params.follower_id)}x.clear();x.addAll(hs);ctx._source.followers=x}

HashSet hs=new HashSet();if(ctx._source.id==params.follower_id){List x=ctx._source.followings;if(params.action==1){x.add(params.following_id);hs.addAll(x)}else{hs.addAll(x);hs.remove(params.following_id)}x.clear();x.addAll(hs);ctx._source.followings=x}else if(ctx._source.id==params.following_id){List x=ctx._source.followers;if(params.action==1){x.add(params.follower_id);hs.addAll(x)}else{hs.addAll(x);hs.remove(params.follower_id)}x.clear();x.addAll(hs);ctx._source.followers=x}


// add following_id in multiple users
List x= ctx._source.followings;
HashSet hs = new HashSet();
if(x!=null){
	x = new ArrayList();
}
x.clear();
hs.addAll(x);
hs.add(params.following_id);
x.addAll(hs);
return x;

//above code compresss
List x = ctx._source.followings;HashSet hs=new HashSet();if(x==null){x=new ArrayList();} hs.addAll(x);x.clear();hs.add(params.following_id);x.addAll(hs);Collections.sort(x);ctx._source.followings = x;

//above vise versa
List x = ctx._source.followers;HashSet hs=new HashSet();if(x==null){x=new ArrayList();} hs.addAll(x);x.clear();hs.add(params.follower_id);x.addAll(hs);Collections.sort(x);ctx._source.followers = x;