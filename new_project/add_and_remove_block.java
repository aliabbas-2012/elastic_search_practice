HashSet hs1 = new HashSet();
HashSet hs2 = new HashSet();
HashSet hs3 = new HashSet();
if (ctx._source.id == params.user_id) {
 if (params.action == 1) {
 	//remove from followings
  	int found_index = -1;
  	List followings = ctx._source.followings;
  	if (followings != null && followings.size() > 0) {
  		for (int i = 0; i < followings.size(); i++) {
	  		if (followings.get(i).following_id == params.blocked_user_id) {
	   			found_index = i;
	   			break;
	  		}
	  	}
 	}
	if (found_index != -1) {
	  ctx._source.followings.remove(found_index)
	}
  //remove from followers	
  List x2 = ctx._source.followers;
  hs2.addAll(x2);
  hs2.remove(params.blocked_user_id);
  x2.clear();
  x2.addAll(hs2);
  ctx._source.followers = x2;
  //add in my_block_list
  List x3 = ctx._source.my_block_list;
  x3.add(params.blocked_user_id);
  hs3.addAll(x3);
  x3.clear();
  x3.addAll(hs3);
  ctx._source.my_block_list = x3
 } else if (params.action == 0) {
  List x1 = ctx._source.my_block_list;
  hs1.addAll(x1);
  hs1.remove(params.blocked_user_id);
  x1.clear();
  x1.addAll(hs1);
  ctx._source.my_block_list = x1;
 }
} else if (ctx._source.id == params.blocked_user_id) {
  if (params.action == 1) {

  	//remove from followings
  	int found_index = -1;
  	List followings = ctx._source.followings;
  	if (followings != null && followings.size() > 0) {
  		for (int i = 0; i < followings.size(); i++) {
	  		if (followings.get(i).following_id == params.user_id) {
	   			found_index = i;
	   			break;
	  		}
	  	}
 	}
	if (found_index != -1) {
	  ctx._source.followings.remove(found_index)
	}

  //remove from followers 	
  List x2 = ctx._source.followers;
  hs2.addAll(x2);
  hs2.remove(params.user_id);
  x2.clear();
  x2.addAll(hs2);
  ctx._source.followers = x2;

  //add in blocked_me_list
  List x3 = ctx._source.blocked_me_list;
  x3.add(params.user_id);
  hs3.addAll(x3);
  x3.clear();
  x3.addAll(hs3);
  ctx._source.blocked_me_list = x3
 } else if (params.action == 0) {
  List x1 = ctx._source.blocked_me_list;
  hs1.addAll(x1);
  hs1.remove(params.user_id);
  x1.clear();
  x1.addAll(hs1);
  ctx._source.blocked_me_list = x1;
 }
}


HashSet hs1=new HashSet();HashSet hs2=new HashSet();HashSet hs3=new HashSet();if(ctx._source.id==params.user_id){if(params.action==1){int found_index=-1;List followings=ctx._source.followings;if(followings!=null&&followings.size()>0){for(int i=0;i<followings.size();i++){if(followings.get(i).following_id==params.blocked_user_id){found_index=i;break;}}}if(found_index!=-1){ctx._source.followings.remove(found_index)}List x2=ctx._source.followers;hs2.addAll(x2);hs2.remove(params.blocked_user_id);x2.clear();x2.addAll(hs2);ctx._source.followers=x2;List x3=ctx._source.my_block_list;x3.add(params.blocked_user_id);hs3.addAll(x3);x3.clear();x3.addAll(hs3);ctx._source.my_block_list=x3}else if(params.action==0){List x1=ctx._source.my_block_list;hs1.addAll(x1);hs1.remove(params.blocked_user_id);x1.clear();x1.addAll(hs1);ctx._source.my_block_list=x1;}}else if(ctx._source.id==params.blocked_user_id){if(params.action==1){int found_index=-1;List followings=ctx._source.followings;if(followings!=null&&followings.size()>0){for(int i=0;i<followings.size();i++){if(followings.get(i).following_id==params.user_id){found_index=i;break;}}}if(found_index!=-1){ctx._source.followings.remove(found_index)}List x2=ctx._source.followers;hs2.addAll(x2);hs2.remove(params.user_id);x2.clear();x2.addAll(hs2);ctx._source.followers=x2;List x3=ctx._source.blocked_me_list;x3.add(params.user_id);hs3.addAll(x3);x3.clear();x3.addAll(hs3);ctx._source.blocked_me_list=x3}else if(params.action==0){List x1=ctx._source.blocked_me_list;hs1.addAll(x1);hs1.remove(params.user_id);x1.clear();x1.addAll(hs1);ctx._source.blocked_me_list=x1;}}