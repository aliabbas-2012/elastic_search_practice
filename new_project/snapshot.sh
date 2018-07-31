curl -XPUT -H 'Content-Type: application/json'  'http://127.0.0.1:9200/_snapshot/my_backup' -d '
{
  "type": "fs",
  "settings": {
    "location": "my_backup_location"
  }
}
'

curl -XPUT -H 'Content-Type: application/json'  'http://127.0.0.1:9200/_snapshot/my_backup/snapshot_2?wait_for_completion=true' -d ' 
{
  "indices": "trending",
  "ignore_unavailable": true,
  "include_global_state": false
}
'

