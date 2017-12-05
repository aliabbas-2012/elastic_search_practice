curl -XGET 127.0.0.1:9200/movies/movie/_search?pretty

curl -XGET 127.0.0.1:9200/movies/movie/1924


curl -XGET 127.0.0.1:9200/movies/movie/_search?q=Dark&pretty
