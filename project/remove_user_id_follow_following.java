try
{
    List x = params._source.followings
    return x.contains(params.user_id);
}
catch (Exception e)‏
{
    return false;
}

try
{List x=params._source.followings
return x.contains(params.user_id);}
catch(Exception e)‏
{return false;}


try { List x=params._source['followings']; return x.contains(params.user_id); } catch(Exception e) { return false; }

List x = params._source['followings']; if(x!=null) {  return x.contains(params.user_id); } return false;

List x1 = ctx._source['followings'];
HashSet hs1 =new HashSet();
hs1.addAll(x1);
x1.clear();
hs1.remove(params.user_id);
x1.addAll(hs1);
ctx._source.followings = x1;


List x2 = ctx._source['followers'];
HashSet hs2 =new HashSet();
hs2.addAll(x2);
x2.clear();
hs2.remove(params.user_id);
x2.addAll(hs2);
ctx._source.followings = x2;

List x1=ctx._source['followings'];HashSet hs1=new HashSet();hs1.addAll(x1);x1.clear();hs1.remove(params.user_id);x1.addAll(hs1);ctx._source.followings=x1;List x2=ctx._source['followers'];HashSet hs2=new HashSet();hs2.addAll(x2);x2.clear();hs2.remove(params.user_id);x2.addAll(hs2);ctx._source.followings=x2;