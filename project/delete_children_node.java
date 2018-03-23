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
String old_name;
for (int i = 0; i < x.size(); i++) {
	if(x.get(i).id.equals(params.box_id)){
		old_name = x.get(i).name;
		x.remove(i);
	}
} ctx._source.boxes = x;
HashSet hs = new HashSet();List xt = ctx._source.tag_keywords;
xt.removeIf(Objects::isNull);xt.replaceAll(String::toLowerCase);
hs.addAll(xt);hs.remove(old_name.toLowerCase());
xt.clear();xt.addAll(hs);ctx._source.tag_keywords=xt;

//minfy
List x=ctx._source.boxes;String old_name;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){old_name=x.get(i).name;x.remove(i);}}ctx._source.boxes=x;HashSet hs=new HashSet();List xt=ctx._source.tag_keywords;xt.removeIf(Objects::isNull);xt.replaceAll(String::toLowerCase);hs.addAll(xt);hs.remove(old_name.toLowerCase());xt.clear();xt.addAll(hs);ctx._source.tag_keywords=xt;


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