List followers = params._source.followers;
HashSet hs = new HashSet();
hs.addAll(followers);
return hs.contains(params.user_id);

List followers=params._source.followers;HashSet hs=new HashSet();hs.addAll(followers);return hs.contains(params.user_id);