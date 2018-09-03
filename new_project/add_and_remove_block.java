List xbl = ctx._source.my_block_list;
HashSet hsbl = new HashSet();
if (xbl == null) {
 xbl = new ArrayList();
}
hsbl.addAll(xbl);

List xbml = ctx._source.blocked_me_list;
HashSet hsbml = new HashSet();
if (xbml == null) {
 xbml = new ArrayList();
}
hsbml.addAll(xbml);

if (params.action == 1) {
	if(ctx._source.id == params.user_id){
		hsbl.add(params.blocked_user_id);
	}
	else if(ctx._source.id == params.blocked_user_id){
		hsbml.add(params.user_id);
	}
 	
} else {
 	if(ctx._source.id == params.user_id){
		hsbl.remove(params.blocked_user_id);
	}
	else if(ctx._source.id == params.blocked_user_id){
		hsbml.remove(params.user_id);
	}
}

xbl.clear();
xbl.addAll(hsbl);
xbml.clear();
xbml.addAll(hsbml);

Collections.sort(xbl);
Collections.sort(xbml);

ctx._source.my_block_list = xbl;
ctx._source.blocked_me_list = xbml;



//

List xbl=ctx._source.my_block_list;HashSet hsbl=new HashSet();if(xbl==null){xbl=new ArrayList();}
hsbl.addAll(xbl);List xbml=ctx._source.blocked_me_list;HashSet hsbml=new HashSet();if(xbml==null){xbml=new ArrayList();}
hsbml.addAll(xbml);if(params.action==1){if(ctx._source.id==params.user_id){hsbl.add(params.blocked_user_id);}
else if(ctx._source.id==params.blocked_user_id){hsbml.add(params.user_id);}}else{if(ctx._source.id==params.user_id){hsbl.remove(params.blocked_user_id);}
else if(ctx._source.id==params.blocked_user_id){hsbml.remove(params.user_id);}}
xbl.clear();xbl.addAll(hsbl);xbml.clear();xbml.addAll(hsbml);Collections.sort(xbl);Collections.sort(xbml);ctx._source.my_block_list=xbl;ctx._source.blocked_me_list=xbml;