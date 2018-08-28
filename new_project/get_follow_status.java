List followings = params._source.followings;
HashSet hs = new HashSet();
hs.addAll(followings);
return hs.contains(params.user_id);

List followings=params._source.followings;HashSet hs=new HashSet();hs.addAll(x);return hs.contains(params.user_id);