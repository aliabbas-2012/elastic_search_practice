//add box
Map map1 = new HashMap();

List boxes = ctx._source.boxes;
List new_box = new ArrayList();
if (boxes != null && boxes.size() > 0) {
 for (int i = 0; i < boxes.size(); i++) {
  map1.put(boxes.get(i).id, boxes.get(i));
 }
 if (!map1.containsKey(params.box.id)) {
   new_box.add(params.box);
 }
 ctx._source.boxes.addAll(new_box);
} else {
 ctx._source.boxes = params.box;
}

Map map1=new HashMap();List boxes=ctx._source.boxes;List new_box=new ArrayList();if(boxes!=null&&boxes.size()>0){for(int i=0;i<boxes.size();i++){map1.put(boxes.get(i).id,boxes.get(i));}
if(!map1.containsKey(params.box.id)){new_box.add(params.box);}
ctx._source.boxes.addAll(new_box);}else{ctx._source.boxes=params.box;}




//delete Box
for (int i = 0; i < ctx._source.boxes.size();i++){if(ctx._source.boxes[i].id == 1605730){ctx._source.boxes.remove(i);}}