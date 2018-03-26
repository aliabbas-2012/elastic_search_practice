try {
 	ctx._source.boxes.add(params.box);
} catch (NullPointerException e) {
 	ctx._source.boxes = [];
 	ctx._source.boxes.add(params.box);
}
HashSet hs = new HashSet();List xt = ctx._source.tag_keywords;
xt.removeIf(Objects::isNull);xt.replaceAll(String::toLowerCase);hs.addAll(xt);
hs.add(params.box_name_keyword.toLowerCase());
xt.clear();xt.addAll(hs);ctx._source.tag_keywords=xt;

//minify code
try{ctx._source.boxes.add(params.box);}catch(NullPointerException e){ctx._source.boxes=[];ctx._source.boxes.add(params.box);}
HashSet hs=new HashSet();List xt=ctx._source.tag_keywords;xt.removeIf(Objects::isNull);xt.replaceAll(String::toLowerCase);hs.addAll(xt);hs.add(params.box_name_keyword.toLowerCase());xt.clear();xt.addAll(hs);ctx._source.tag_keywords=xt;
