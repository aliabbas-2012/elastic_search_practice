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
for (int i = 0; i < x.size(); i++) {
	if(x.get(i).id.equals(params.box_id)){
		x.get(i).name = params.new_name;
	}
} ctx._source.boxes = x;

//minfy
List x=ctx._source.boxes;for(int i=0;i<x.size();i++){if(x.get(i).id.equals(params.box_id)){x.get(i).name=params.new_name;}}ctx._source.boxes=x;