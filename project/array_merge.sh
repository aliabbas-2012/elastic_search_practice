GET hockey/_search
{
  "query": {
    "match_all": {}
  },
  "script_fields": {
    "total_goals": {
      "script": {
        "lang": "painless",
        "source": "List x,y = new ArrayList(); x = doc['goals'];y = doc['assists']; x.addAll(y);return x"
      }
    }
  }
}
GET hockey/_search
{
  "query": {
    "match_all": {}
  },
  "script_fields": {
    "total_goals": {
      "script": {
        "lang": "painless",
        "source": "List x = new ArrayList();for (int i = 0; i < doc['goals'].length; ++i) { x.add(doc['goals'][i]) } for (int i = 0; i < doc['assists'].length; ++i) { x.add(doc['assists'][i]) } return x;"
      }
    }
  }
}

GET hockey/_search
{
  "query": {
    "match_all": {}
  },
  "script_fields": {
    "total_goals": {
      "script": {
        "lang": "painless",
        "source": "HashSet hs = new HashSet();List x = new ArrayList();for (int i = 0; i < doc['goals'].length; ++i) { x.add(doc['goals'][i]) } for (int i = 0; i < doc['assists'].length; ++i) { x.add(doc['assists'][i]) } hs.addAll(x); x.clear();x.addAll(hs); return x;"
      }
    }
  }
}

GET hockey/_search
{
  "query": {
    "match_all": {}
  },
  "script_fields": {
    "total_goals": {
      "script": {
        "lang": "painless",
        "source": "HashSet hs = new HashSet();List x = new ArrayList(doc['goals'].values);List y = new ArrayList(doc['assists'].values);x.addAll(y);hs.addAll(x); x.clear();x.addAll(hs);return x"
      }
    }
  }
}