#Added in Local only 
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "box_posts": {
      "type": "nested",
       "index": true
    }
  }
}
'
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "status": {
      "type": "keyword",
      "index": true
    }
  }
}
'
curl -XPUT  -H 'Content-Type: application/json' 'http://localhost:9200/trending/_mapping/doc/' -d '
{
  "properties": {
    "uid": {
      "type": "keyword",
       "index": true
    }
  }
}

'