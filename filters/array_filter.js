 do_not_return = true; 
 for(list in doc['tag_keywords.raw']) { 
    if(!list.contains('a')) {
      do_not_return = false;
    }
  };
return do_not_return;

  
for (def i = 0; i < doc['_id'].length; i++) {  doc['_id'][i] == 18991 ? doc : null }

GET posts/post/_search
{
  "size": 100,
  "_source": [ "tag_keywords" ],
  "query": {
    "bool" : {
        "must" : {
            "script" : {
                "script" : {
                    "source": "doc['tag_keywords.raw'].values.removeIf(item -> item == 'Randoms')",
                    "lang": "painless"
                 }
            }
        }
    }
  }
}

GET posts/post/_search
{
  "size": 100,
  "_source": [ "tag_keywords" ],
  "query": {
    "bool" : {
        "must" : {
            "script" : {
                "script" : {
                    "source": "for (def i = 0; i < doc['tag_keywords'].values.length; i++) {  doc['_id'][i] = doc['_id'][i] + 1 }",
                    "lang": "painless"
                 }
            }
        }
    }
  }
}
int isClosed = 0;
long latestTimestamp = 0;
for (int i = 0; i < doc['history.type.keyword'].values.length; i++) {
 if (doc['history.type.keyword'][i] == 'status') {
  if (doc['history.timestamp'][i] > latestTimestamp) {
   latestTimestamp = doc['history.timestamp'][i];
   if (doc['history.category.keyword'][i] == 'closed') {
    isClosed = 1
   } else {
    isClosed = 0
   }
  }
 }
}
return isClosed;

int isClosed = 0;
long latestTimestamp = 0;
for (int i = 0; i < doc['tag_keywords.raw'].values.length; i++) {
 if (doc['tag_keywords.raw'].values[i] == 's') {
    isClosed = 1;
 }
}
return isClosed;

do_not_return = true; for(element in doc['tag_keywords.raw'].values) { if(!element.contains('s')) {do_not_return = false;}};return do_not_return;