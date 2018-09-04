HashSet box_ids_h = new HashSet();
box_ids_h.addAll(params.box_ids);
for (int i = 0; i < ctx._source.boxes.size(); i++) {
 if(box_ids_h.containsKey(ctx._source.boxes[i].id)){
 	 ctx._source.boxes.get(i).post_count--;
 }
}

HashSet box_ids_h=new HashSet();box_ids_h.addAll(params.box_ids);for(int i=0;i<ctx._source.boxes.size();i++){if(box_ids_h.containsKey(ctx._source.boxes[i].id)){ctx._source.boxes.get(i).post_count--;}}