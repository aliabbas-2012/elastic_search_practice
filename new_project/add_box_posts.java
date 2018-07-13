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
Map<Integer, Object> map1 = new HashMap<Integer, Object>();
Map<Integer, Object> map2 = new HashMap<Integer, Object>();
Map<Integer, Object> map3 = new HashMap<Integer, Object>();
for(int i=0;i<box_posts.size();i++)
{
    map1.put(box_posts.get(i).id,box_posts.get(i));
}

map3.addAll(map1);
map3.addAll(map2);

List x = new ArrayList();
for (Map.Entry<String, Object> entry : map3.entrySet()) {
    Object post = entry.getValue();
    x.add(post);
}

ctx._source.box_posts = x;


List box_posts=params.box_posts;Map<Integer,Object>map1=new HashMap<>();Map<Integer,Object>map2=new HashMap<>();Map<Integer,Object>map3=new HashMap<>();for(Object post:box_posts){map1.put(post.id,post);}for(Object post:ctx._source.box_posts){map2.put(post.id,post);}map3.addAll(map1);map3.addAll(map2);List x=new ArrayList();for(Map.Entry<String,Object>entry:map3.entrySet()){Object post=entry.getValue();x.add(post);}