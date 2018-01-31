List x = new ArrayList();
for (int i = 0; i < doc['tag_keywords'].length; ++i) { 
	String s = doc['tag_keywords'][i];
	if(s.startsWith("ali")){
		x.add(s);
	}

} 
return x;



List x = new ArrayList();for (int i = 0; i < doc['tag_keywords'].length; ++i) { String s = doc['tag_keywords'][i];if(s.startsWith("ali")){ x.add(s);}} return x;


List x = new ArrayList(params._source['followings']);String id = params._source['id'];if(x.contains(params.keyword)){ return id;}