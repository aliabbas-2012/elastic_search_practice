POST /posts/_search
{
  "size": 0,
  "aggregations": {
    "dayOfWeek": {
      "terms": {
        "script": {
          "source": "Instant.ofEpochMilli(doc.created_at.value.millis).atZone(ZoneId.of(params.tz)).dayOfWeek",
          "params": {
            "tz": "Europe/London"
          }
        }
      },
      "aggs": {
        "hourOfDay": {
          "terms": {
            "script": {
              "source": "Instant.ofEpochMilli(doc.created_at.value.millis).atZone(ZoneId.of(params.tz)).hour",
              "params": {
                "tz": "Europe/London"
              }
            }
          }
        }
      }
    }
  }
}


POST /posts/_search
{
  "size": 0,
  "aggregations": {
    "dayOfWeek": {
      "terms": {
        "script": {
          "source": "Instant.ofEpochMilli(doc.created_at.value.millis).atZone(ZoneId.of(params.tz))",
          "params": {
            "tz": "Europe/London"
          }
        }
      },
      "aggs": {
        "hourOfDay": {
          "terms": {
            "script": {
              "source": "Instant.ofEpochMilli(doc.created_at.value.millis).atZone(ZoneId.of(params.tz)).hour",
              "params": {
                "tz": "Europe/London"
              }
            }
          }
        }
      }
    }
  }
}