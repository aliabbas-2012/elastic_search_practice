List box_posts = params.box_posts;
Map<Integer, Object> map1 = new HashMap<>();
Map<Integer, Object> map2 = new HashMap<>();
Map<Integer, Object> map3 = new HashMap<>();
for(Object post : box_posts)
{
    map1.put(post.id,post);
}
for(Object post: ctx._source.box_posts)
{
	map2.put(post.id,post);
}
map3.addAll(map1);
map3.addAll(map2);

List x = new ArrayList();
for (Map.Entry<String, Object> entry : map3.entrySet()) {
    Object post = entry.getValue();
    x.add(post);
}


List box_posts = params.box_posts.get(ctx._source.id);
Map<Integer, Object> map3 = new HashMap<Integer, Object>();
for(int i=0;i<box_posts.size();i++)
{
    map3.put(box_posts.get(i).id,box_posts.get(i));
}


List x = new ArrayList();
for (Map.Entry<String, Object> entry : map3.entrySet()) {
    Object post = entry.getValue();
    x.add(post);
}

ctx._source.box_posts = x;


List box_posts=params.pay_load;Map map1=new HashMap<>();Map<Integer,Object>map2=new HashMap<>();Map<Integer,Object>map3=new HashMap<>();for(Object post:box_posts){map1.put(post.id,post);}for(Object post:ctx._source.box_posts){map2.put(post.id,post);}map3.addAll(map1);map3.addAll(map2);List x=new ArrayList();for(Map.Entry<String,Object>entry:map3.entrySet()){Object post=entry.getValue();x.add(post);}


Map map1 = new HashMap();
List params_box_posts = params.pay_load.get(ctx._source.id);
List box_posts = ctx._source.box_posts;
List update_box_posts = new ArrayList();
if(box_posts.size()>0){

	for (int i = 0; i < box_posts.size(); i++) {
 		map1.put(box_posts.get(i).id, box_posts.get(i));
	}
	for (int i = 0; i < params_box_posts.size(); i++) {
		if(!map1.containsKey(params_box_posts.get(i).id)){
			update_box_posts.add(params_box_posts.get(i));
		}
	}
	ctx._source.box_posts.addAll(update_box_posts);
}
else {
	ctx._source.box_posts = params_box_posts;
}


Map map1=new HashMap();List params_box_posts=params.pay_load.get(ctx._source.id);List box_posts=ctx._source.box_posts;List update_box_posts=new ArrayList();if(box_posts.size()>0){for(int i=0;i<box_posts.size();i++){map1.put(box_posts.get(i).id,box_posts.get(i));}for(int i=0;i<params_box_posts.size();i++){if(!map1.containsKey(params_box_posts.get(i).id)){update_box_posts.add(params_box_posts.get(i));}}ctx._source.box_posts.addAll(update_box_posts);}else{ctx._source.box_posts=params_box_posts;}