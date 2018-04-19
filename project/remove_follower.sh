POST users/_update_by_query?conflicts=proceed
{
	"script": {
		"source": "HashSet hs = new HashSet();List x=ctx._source.followers;hs.addAll(x);hs.remove(params.user_id);x.clear();x.addAll(hs);ctx._source.followers=x;",
		"lang": "painless",
		"params": {
			"user_id": 5
		}
	},
	"query": {
	    "bool": {
	      "must": {
	        "terms": {
	          "followers": [
	            5
	          ]
	        }
	      }
	   }
  }
}
