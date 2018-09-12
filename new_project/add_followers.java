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






// add followers in bulk


List x = ctx._source.followers;
List params_followers = params.pay_load.get(ctx._source.id.toString());
List params_followers_no_int = params.pay_load.get(ctx._source.id);
HashSet hs = new HashSet();
if (x == null) {
 x = new ArrayList();
}
x.addAll(params_followers);
if(params_followers_no_int!=null  && params_followers_no_int.size() > 0){
	x.addAll(params_followers_no_int);	
}
hs.addAll(x);
x.clear();
x.addAll(hs);
Collections.sort(x);
ctx._source.followers = x;

List x=ctx._source.followers;List params_followers=params.pay_load.get(ctx._source.id.toString());List params_followers_no_int=params.pay_load.get(ctx._source.id);HashSet hs=new HashSet();if(x==null){x=new ArrayList();}
x.addAll(params_followers);if(params_followers_no_int!=null&&params_followers_no_int.size()>0){x.addAll(params_followers_no_int);}
hs.addAll(x);x.clear();x.addAll(hs);Collections.sort(x);ctx._source.followers=x;



//add single followers

List x = ctx._source.followers;
HashSet hs = new HashSet();
if (x == null) {
 x = new ArrayList();
}
hs.addAll(x);
if(params.action == "A"){
	hs.add(params.follower_id);	
}
else {
	hs.remove(params.follower_id);
}
x.clear();
x.addAll(hs);
Collections.sort(x);
ctx._source.followers = x;

List x=ctx._source.followers;HashSet hs=new HashSet();if(x==null){x=new ArrayList();}
hs.addAll(x);hs.add(params.follower_id);x.clear();x.addAll(hs);Collections.sort(x);ctx._source.followers=x;


for (int i = 0; i < ctx._source.box_posts.size(); i++) {
 int post_id = ctx._source.box_posts.get(i).id;
 if (params.posts.containsKey(post_id)) {
  ctx._source.box_posts.get(i).score = params.posts.get(post_id);
 }
}