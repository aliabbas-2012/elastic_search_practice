//delete single post 
for (int i = 0; i < ctx._source.box_posts.size(); i++) {
 if (ctx._source.box_posts[i].id == params.post_id) {
  ctx._source.box_posts.remove(i);
 }
}

for (int i = 0; i < ctx._source.box_posts.size();i++){if(ctx._source.box_posts[i].id == params.post_id){ctx._source.box_posts.remove(i);}}


//delete bulk post 
HashSet post_ids_h = new HashSet();
post_ids_h.addAll(params.posts);	
for (int i = 0; i < ctx._source.box_posts.size(); i++) {
 	if (post_ids_h.contains(ctx._source.box_posts[i].id)) {
	  	ctx._source.box_posts.remove(i);
	}
}

HashSet post_ids_h=new HashSet();post_ids_h.addAll(params.posts);for(int i=0;i<ctx._source.box_posts.size();i++){if(post_ids_h.contains(ctx._source.box_posts[i].id)){ctx._source.box_posts.remove(i);}}



//decrement post_count from boxes
HashSet box_ids_h = new HashSet();
box_ids_h.addAll(params.box_ids);
for (int i = 0; i < ctx._source.boxes.size(); i++) {
 if (box_ids_h.contains(ctx._source.boxes[i].id)) {
  ctx._source.boxes.get(i).post_count--;
 }
}

HashSet box_ids_h=new HashSet();box_ids_h.addAll(params.box_ids);for(int i=0;i<ctx._source.boxes.size();i++){if(box_ids_h.contains(ctx._source.boxes[i].id)){ctx._source.boxes.get(i).post_count--;}}

