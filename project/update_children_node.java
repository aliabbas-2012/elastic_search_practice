//update box name
List x = params._source.boxes;
for (int i = 0; i < x.size(); i++) {
	if(x.get(i).id.equals(params.box_id)){
		x.get(i).name = params.new_name;
	}
} return x;

List x=params._source.boxes;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){x.get(i).name=params.new_name;}}return x;


//Update by query 

List x = ctx._source.boxes;
String old_name;
for (int i = 0; i < x.size(); i++) {
 if (x.get(i).id.equals(params.box_id)) {
 	old_name = x.get(i).name;
  	x.get(i).name = params.new_name;
 }
} ctx._source.boxes = x;HashSet hs = new HashSet();List xt = ctx._source.tag_keywords;
xt.removeIf(Objects::isNull);xt.replaceAll(String::toLowerCase);hs.addAll(xt);
hs.remove(old_name.toLowerCase());hs.add(params.new_name.toLowerCase());
xt.clear();xt.addAll(hs);ctx._source.tag_keywords=xt;

//minfy
List x=ctx._source.boxes;String old_name;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){old_name=x.get(i).name;x.get(i).name=params.new_name;}}ctx._source.boxes=x;HashSet hs=new HashSet();List xt=ctx._source.tag_keywords;xt.removeIf(Objects::isNull);xt.replaceAll(String::toLowerCase);hs.addAll(xt);hs.remove(old_name.toLowerCase());hs.add(params.new_name.toLowerCase());xt.clear();xt.addAll(hs);ctx._source.tag_keywords=xt;