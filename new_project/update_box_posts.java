if(ctx._source.box_posts.size()>0){

	for (int i = 0; i < ctx._source.box_posts.size(); i++) {
		if(ctx._source.box_posts.get(i).id ==2490970){
			ctx._source.box_posts.get(i).created_at = '2018-07-15T11:00:03Z'
		}
 		
	}
}


// if(ctx._source.box_posts.size()>0){for(int i=0;i<ctx._source.box_posts.size();i++){ctx._source.box_posts.get(i).created_at='2018-07-16T11:00:03Z'}}

if(ctx._source.box_posts.size()>0){for(int i=0;i<ctx._source.box_posts.size();i++){if(ctx._source.box_posts.get(i).id==2490970){ctx._source.box_posts.get(i).created_at='2018-07-15T11:00:03Z'}}}
