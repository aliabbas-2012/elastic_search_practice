HashSet hs = new HashSet();
List x = ctx._source.tag_keywords;
hs.addAll(x);
hs.remove(ctx._source.username.trim().toLowerCase());
hs.remove(ctx._source.full_name.trim().toLowerCase());
hs.add(params.username.trim().toLowerCase());
hs.add(params.full_name.trim().toLowerCase());
x.clear();
x.addAll(hs);
ctx._source.tag_keywords = x;



POST posts/_update_by_query
{
  "script": {
    "source": "HashSet hs=new HashSet();List x=ctx._source.tag_keywords;hs.addAll(x);hs.remove(ctx._source.username.trim().toLowerCase());hs.remove(ctx._source.full_name.trim().toLowerCase());hs.add(params.username.trim().toLowerCase());hs.add(params.full_name.trim().toLowerCase());x.clear();x.addAll(hs);ctx._source.tag_keywords=x;",
    "lang": "painless",
    "params":{
    	"username": "ubeter1",
    	"full_name":"Hassan Shahid2"
    }
  },
  "query": {
    "term": {
      "user_id": 9600
    }
  }
}