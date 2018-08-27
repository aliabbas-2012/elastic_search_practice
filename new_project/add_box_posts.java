Map map1 = new HashMap();
List params_box_posts = params.pay_load.get(ctx._source.id);
List box_posts = ctx._source.box_posts;
List update_box_posts = new ArrayList();
if (box_posts.size() > 0) {
 for (int i = 0; i < box_posts.size(); i++) {
  map1.put(box_posts.get(i).id, box_posts.get(i));
 }
 for (int i = 0; i < params_box_posts.size(); i++) {
  if (!map1.containsKey(params_box_posts.get(i).id)) {
   update_box_posts.add(params_box_posts.get(i));
  }
 }
 ctx._source.box_posts.addAll(update_box_posts);
} else {
 ctx._source.box_posts = params_box_posts;
}



Map map1 = new HashMap();List params_box_posts=params.pay_load.get(ctx._source.id);List box_posts=ctx._source.box_posts;List update_box_posts=new ArrayList();if(box_posts.size()>0){for(int i=0;i<box_posts.size();i++){map1.put(box_posts.get(i).id,box_posts.get(i));}for(int i=0;i<params_box_posts.size();i++){if(!map1.containsKey(params_box_posts.get(i).id)){update_box_posts.add(params_box_posts.get(i));}}ctx._source.box_posts.addAll(update_box_posts);}else{ctx._source.box_posts=params_box_posts;}