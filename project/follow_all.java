HashMap map = params.followings;
for (String key: params.users_array) {
 Integer follower_id = Integer.parseInt(key);
 Integer following_id = params.followings.get(follower_id);
 HashSet hs = new HashSet();
 if (ctx._source.id == follower_id) {
  List x = ctx._source.followings;
  x.add(following_id);
  hs.addAll(x);
  x.clear();
  x.addAll(hs);
  ctx._source.followings = x;
 } else if (ctx._source.id == following_id) {
  List x = ctx._source.followers;
  x.add(follower_id);
  hs.addAll(x);
  x.clear();
  x.addAll(hs);
  ctx._source.followers = x;
 }
}

HashMap map=params.followings;for(String key:params.users_array){Integer follower_id=Integer.parseInt(key);Integer following_id=params.followings.get(follower_id);HashSet hs=new HashSet();if(ctx._source.id==follower_id){List x=ctx._source.followings;x.add(following_id);hs.addAll(x);x.clear();x.addAll(hs);ctx._source.followings=x;}else if(ctx._source.id==following_id){List x=ctx._source.followers;x.add(follower_id);hs.addAll(x);x.clear();x.addAll(hs);ctx._source.followers=x;}}