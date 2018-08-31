
Map map1 = new HashMap();
List params_followings = params.pay_load.get(ctx._source.id.toString());
List followings = ctx._source.followings;
List update_followings = new ArrayList();
if (followings != null && followings.size() > 0) {
 for (int i = 0; i < followings.size(); i++) {
  map1.put(followings.get(i).id, followings.get(i));
 }
 for (int i = 0; i < params_followings.size(); i++) {
  if (!map1.containsKey(params_followings.get(i).id)) {
   update_followings.add(params_followings.get(i));
  }
 }
 ctx._source.followings.addAll(update_followings);
} else {
 ctx._source.followings = params_followings;
}

Map map1=new HashMap();List params_followings=params.pay_load.get(ctx._source.id.toString());List followings=ctx._source.followings;List update_followings=new ArrayList();if(followings!=null&&followings.size()>0){for(int i=0;i<followings.size();i++){map1.put(followings.get(i).id,followings.get(i));}
for(int i=0;i<params_followings.size();i++){if(!map1.containsKey(params_followings.get(i).id)){update_followings.add(params_followings.get(i));}}
ctx._source.followings.addAll(update_followings);}else{ctx._source.followings=params_followings;}


//add single followings

int found_index = -1;
List followings = ctx._source.followings;
List new_follower = new ArrayList();
if (followings != null && followings.size() > 0) {

 for (int i = 0; i < followings.size(); i++) {
  	if(followings.get(i).id == params.follower.id){
  		found_index = i;
  		break;
  	}
 }
 if (found_index!=-1) {
  	ctx._source.followings[found_index] = params.follower;
 }
 else {
 	ctx._source.followings.add(params.follower);
 }

} else {
 ctx._source.followings = [params.follower];
}
int found_index=-1;List followings=ctx._source.followings;List new_follower=new ArrayList();if(followings!=null&&followings.size()>0){for(int i=0;i<followings.size();i++){if(followings.get(i).id==params.follower.id){found_index=i;break;}} if(found_index!=-1){ctx._source.followings[found_index]=params.follower;}else{ctx._source.followings.add(params.follower);}}else{ctx._source.followings=[params.follower];}

