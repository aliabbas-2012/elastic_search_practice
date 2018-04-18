List x = ctx._source.boxes;
for (int i = 0; i < x.size(); i++) {
	x.get(i).post_id = ctx._source.id;
} 
ctx._source.boxes = x;


List x=ctx._source.boxes;for(int i=0;i<x.size();i++){x.get(i).post_id=ctx._source.id;}
ctx._source.boxes=x;