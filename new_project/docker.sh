sudo docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2


#run using volume
sudo docker run --name devtest1 -p 9200:9200 -p 9300:9300 -v foo:/app -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2
sudo docker run --name esdev -p 9200:9200 -p 9300:9300 -v esdata:/app -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2


sudo docker volume create --driver local \
    --opt type=btrfs \
    --opt device=/home/ali/test-docker \
    esdata

sudo docker volume create  -o mountpoint=/media/docker/es_data
# ssh
sudo docker exec -i -t esdev /bin/bash


sudo docker volume create --driver local \
    --opt type=btrfs \
    --opt device=/media/docker/es_data \
    esdata


sudo docker run --name esdev -p 9200:9200 -p 9300:9300 -v esdata:/app -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.4.0

sudo docker volume create --name es_test  -o mountpoint=/media/docker/es_test -d local-persist 

#Launch es docker
sudo docker run --name esdev -p 9200:9200 -p 9300:9300 -v es_backups:/media/ali/es_backups -v es_data:/es_data -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.4.0

# ssh into 
sudo docker run -it -v es_test:/es_test docker.elastic.co/elasticsearch/elasticsearch:6.4.0 /bin/bash
sudo docker exec -i -t esdev /bin/bash


# create local volume
sudo docker volume create --name es_backups  -o mountpoint=/media/ali/es_backups -d local-persist 



#----------------- Pg database -------------------------#

sudo docker volume create pgdata -o mountpoint=/media/docker/es_data
sudo docker run --name pgdev -e POSTGRES_PASSWORD=admin -p 5433:5433 -p 5432:5432 -v pgdata:/app  postgres

sudo docker run --name pgdev -e POSTGRES_PASSWORD=admin -p 5434:5434 -p 5435:5435 -v pgdata:/app  postgres


sudo docker volume create --name pgadmin4
docker run -p 80:80 \
-e "PGADMIN_DEFAULT_EMAIL=ali@fayvo.com" \
-e "PGADMIN_DEFAULT_PASSWORD=admin" \
-d dpage/pgadmin4

sudo docker run --name pgadmindev  -e "PGADMIN_DEFAULT_EMAIL=ali@fayvo.com" -e "PGADMIN_DEFAULT_PASSWORD=admin" -p 5050:5050 -p 5051:5051 -v pgadmindata:/app  dpage/pgadmin4

pg_dump -U ml_root -h favo-ml-new.cedry454btps.us-west-2.rds.amazonaws.com -p  fayvo_final_rds > fayvo_final_rds.sql

rhA-hH7-BTz-6KK