# Create Repositry
curl -XPUT -H 'Content-Type: application/json'  'http://localhost:9200/_snapshot/es_backups/' -d '
{
  "type": "fs",
  "settings": {
  	"location":"/media/ali/es_backups/backup-large"
  }
}
'

#Taking backups
curl -XPUT -H 'Content-Type: application/json'  'http://localhost:9200/_snapshot/es_backups/snapshot_2?wait_for_completion=true&pretty' -d '
{
  "indices": "trending",
  "ignore_unavailable": true,
  "include_global_state": false
}
'
#Taking status
curl -XGET -H 'Content-Type: application/json'  'http://localhost:9200/_snapshot/es_backups/snapshot_2/_stauts?'