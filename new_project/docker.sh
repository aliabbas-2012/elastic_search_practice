sudo docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2


#run using volume
sudo docker run --name devtest1 -p 9200:9200 -p 9300:9300 -v foo:/app -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2
sudo docker run --name esdev -p 9200:9200 -p 9300:9300 -v esdata:/app -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.3.2


sudo docker volume create --driver local \
    --opt type=btrfs \
    --opt device=/home/ali/test-docker \
    foo

# ssh
sudo docker exec -i -t esdev /bin/bash
