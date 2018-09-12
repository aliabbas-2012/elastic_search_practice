curl -XPUT "http://localhost:9200/trending/_settings" -H 'Content-Type: application/json' -d'
{
  "index": {
    "blocks": {
      "read_only_allow_delete": "false"
    }
  }
}'

curl -XPUT "http://localhost:9200/users/_settings" -H 'Content-Type: application/json' -d'
{
  "index": {
    "blocks": {
      "read_only_allow_delete": "false"
    }
  }


