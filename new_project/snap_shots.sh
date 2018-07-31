# Create Repositry
curl -XPUT -H 'Content-Type: application/json'  'http://localhost:9200/_snapshot/es_backups/' -d '
{
  "type": "fs",
  "settings": {
  	"location":"/media/ali/es_backups/backup-large"
  }
}
'

# Create Repositry
curl -XPUT -H 'Content-Type: application/json'  'http://127.0.0.1:9200/_snapshot/es_backups/?pretty' -d '
{
  "type": "fs",
  "settings": {
  	"location":"/media/es_backups/backup-large"
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


#Restore 
curl -XPOST -H 'Content-Type: application/json'  'http://localhost:9200/_snapshot/es_backups/snapshot_2/_restore?pretty'

curl -XGET -H 'Content-Type: application/json'  'http://localhost:9200/_snapshot/es_backups/snapshot_2/_status?pretty'