doc['created'].date.setZone(org.joda.time.DateTimeZone.forID(tz)); doc['created'].date.dayOfWeek

GET posts/post/_search
{
    "_source": ["created_at","user_id"], 
    "script_fields" : {
        "user_id" : {
            "script" : {
              "lang": "painless",
              "source": "Instant.ofEpochMilli(doc.created_at.value.millis).atZone(ZoneId.of(params.tz))",
              "params": {
                "tz": "Asia/Karachi"
              }
            
            }
        }
    }
}

GET posts/post/_search
{
    "_source": ["created_at","user_id"], 
    "script_fields" : {
        "user_id" : {
            "script" : {
              "lang": "groovy",
              "source": "doc['created'].value.setZone(org.joda.time.DateTimeZone.forID(params.tz))",
              "params": {
                "tz": "Asia/Karachi"
              }
            
            }
        }
    }
}