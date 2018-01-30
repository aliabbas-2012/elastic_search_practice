GET users/user/_search
{
  "query": {
    "match_all": {}
  },
  "script_fields": {
    "total_goals": {
      "script": {
        "lang": "painless",
        "source": "HashSet hs = new HashSet();List x = new ArrayList(doc['blocked_users'].values);List y = new ArrayList(doc['users_blocked'].values);x.addAll(y);hs.addAll(x); x.clear();x.addAll(hs);return x"
      }
    }
  }
}


GET users/user/_search
{
  "query": {
    "match_all": {}
  },
  "script_fields": {
    "total_goals": {
      "script": {
        "lang": "painless",
        "source": "HashSet hs = new HashSet();List x = new ArrayList(params._fields['blocked_users'].values);List y = new ArrayList(params._fields['users_blocked'].values);x.addAll(y);hs.addAll(x); x.clear();x.addAll(hs);return x"
      }
    }
  }
}