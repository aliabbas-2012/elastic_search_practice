//Delete box from post
List x = params._source.boxes;
for (int i = 0; i < x.size(); i++) {
	if(x.get(i).id.equals(params.box_id)){
		x.remove(i);
	}
} return x;

List x=params._source.boxes;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){x.remove(i);}}return x;

//Update by query (Delete box from post)
List x = ctx._source.boxes;
for (int i = 0; i < x.size(); i++) {
	if(x.get(i).id.equals(params.box_id)){
		x.remove(i);
	}
} ctx._source.boxes = x;

//minfy
List x=ctx._source.boxes;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){x.remove(i);}}ctx._source.boxes=x;


//delete posts by box_id if box_count == 1

try {
 if (params._source.boxes.size() == 1) {
  return params._source.boxes.get(0).id.equals(params.box_id);
 } else {
  return false;
 }
} catch (NullPointerException e) {
 return false
}

try{if(params._source.boxes.size()==1){return params._source.boxes.get(0).id.equals(params.box_id);}else{return false;}}catch(NullPointerException e){return false}