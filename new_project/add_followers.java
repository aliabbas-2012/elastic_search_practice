Map map1 = new HashMap();
List params_followers = params.pay_load.get(ctx._source.id.toString());
List followers = ctx._source.followers;
List update_followers = new ArrayList();
if (followers != null && followers.size() > 0) {
 for (int i = 0; i < followers.size(); i++) {
  map1.put(followers.get(i).id, followers.get(i));
 }
 for (int i = 0; i < params_followers.size(); i++) {
  if (!map1.containsKey(params_followers.get(i).id)) {
   update_followers.add(params_followers.get(i));
  }
 }
 ctx._source.followers.addAll(update_followers);
} else {
 ctx._source.followers = params_followers;
}


Map map1=new HashMap();List params_followers=params.pay_load.get(ctx._source.id.toString());List followers=ctx._source.followers;List update_followers=new ArrayList();if(followers!=null&&followers.size()>0){for(int i=0;i<followers.size();i++){map1.put(followers.get(i).id,followers.get(i));}
for(int i=0;i<params_followers.size();i++){if(!map1.containsKey(params_followers.get(i).id)){update_followers.add(params_followers.get(i));}}
ctx._source.followers.addAll(update_followers);}else{ctx._source.followers=params_followers;}


//simple method

Map map1 = new HashMap();
List params_followers = params.pay_load.get(ctx._source.id.toString());
ctx._source.followers.addAll(params_followers);

Map map1 = new HashMap();List params_followers = params.pay_load.get(ctx._source.id.toString());ctx._source.followers.addAll(params_followers);