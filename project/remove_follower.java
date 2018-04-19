HashSet hs = new HashSet();
List x = ctx._source.followers;
hs.addAll(x);
hs.remove(params.user_id);
x.clear();
x.addAll(hs);
ctx._source.followers = x;


HashSet hs = new HashSet();List x=ctx._source.followers;hs.addAll(x);hs.remove(params.user_id);x.clear();x.addAll(hs);ctx._source.followers=x;