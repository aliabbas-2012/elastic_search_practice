
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