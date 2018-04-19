
DELETE series

PUT series
{
  "mappings": {
    "movie": {
      "properties": {
        "film_to_franchise": {
          "type": "join",
          "relations": {
            "franchise": "film",
            "film":"cast"
          }
        },
        "id": {
          "type": "text"
        },
        "is_private":{
            "type":"boolean",
            "index":true
        },
        "genre":{
          "type": "text",
          "index": true
        },
        "title":{
          "type": "text",
          "index": true
        },
        "franchise_name":{
           "type": "text",
          "index": true
        },
        "cast_name":{
          "type": "text",
          "index": true
        },
        "movie_name":{
          "type": "text",
          "index": true
        }
      }
    }
  }
}
GET /series/_search 
POST _bulk
{ "create" : { "_index" : "series", "_type" : "movie", "_id" : "1", "routing" : 1} }
{ "id": "1", "film_to_franchise": {"name": "franchise"}, "title" : "Star Wars" }
{ "create" : { "_index" : "series", "_type" : "movie", "_id" : "260", "routing" : 1} }
{ "id": "260", "film_to_franchise": {"name": "film", "parent": "1"}, "title" : "Star Wars: Episode IV - A New Hope", "year":"1977" , "genre":["Action", "Adventure", "Sci-Fi"] }
{ "create" : { "_index" : "series", "_type" : "movie", "_id" : "1196", "routing" : 1} }
{ "id": "1196", "film_to_franchise": {"name": "film", "parent": "1"}, "title" : "Star Wars: Episode V - The Empire Strikes Back", "year":"1980" , "genre":["Action", "Adventure", "Sci-Fi"] }
{ "create" : { "_index" : "series", "_type" : "movie", "_id" : "1210", "routing" : 1} }
{ "id": "1210", "film_to_franchise": {"name": "film", "parent": "1"}, "title" : "Star Wars: Episode VI - Return of the Jedi", "year":"1983" , "genre":["Action", "Adventure", "Sci-Fi"] }
{ "create" : { "_index" : "series", "_type" : "movie", "_id" : "2628", "routing" : 1} }
{ "id": "2628", "film_to_franchise": {"name": "film", "parent": "1"}, "title" : "Star Wars: Episode I - The Phantom Menace", "year":"1999" , "genre":["Action", "Adventure", "Sci-Fi"] }
{ "create" : { "_index" : "series", "_type" : "movie", "_id" : "5378", "routing" : 1} }
{ "id": "5378", "film_to_franchise": {"name": "film", "parent": "1"}, "title" : "Star Wars: Episode II - Attack of the Clones", "year":"2002" , "genre":["Action", "Adventure", "Sci-Fi", "IMAX"] }
{ "create" : { "_index" : "series", "_type" : "movie", "_id" : "33493", "routing" : 1} }
{ "id": "33493", "film_to_franchise": {"name": "film", "parent": "1"}, "title" : "Star Wars: Episode III - Revenge of the Sith", "year":"2005" , "genre":["Action", "Adventure", "Sci-Fi"] }
{ "create" : { "_index" : "series", "_type" : "movie", "_id" : "122886", "routing" : 1} }
{ "id": "122886", "film_to_franchise": {"name": "film", "parent": "1"}, "title" : "Star Wars: Episode VII - The Force Awakens", "year":"2015" , "genre":["Action", "Adventure", "Fantasy", "Sci-Fi", "IMAX"] }

#put franchies
PUT series/movie/fr1?routing=1&refresh 
{
  "id":"fr1",
  "title": "This is my First franchise",
  "is_private":false,
  "franchise_name": "1st franchise",
  "film_to_franchise": {
    "name": "franchise" 
  }
}

PUT series/movie/fr2?routing=1&refresh 
{
  
  "id":"fr2",
  "title": "This is my 2nd franchise",
  "is_private":true,
  "franchise_name": "2nd franchise",
  "film_to_franchise": {
    "name": "franchise" 
  }
}
#put movies under franchises
PUT series/movie/m1?routing=1&refresh
{
  "id":"m1",
  "title": "This is my First Movie",
  "movie_name": "First Movie",
  "film_to_franchise": {
    "name": "film",
    "parent": "fr1"
  }
}

PUT series/movie/m2?routing=1&refresh
{
  "id":"m2",
  "title": "This is my 2nd Movie",
  "movie_name": "Second Movie",
  "film_to_franchise": {
    "name": "film",
    "parent": "fr2"
  }
}
PUT series/movie/m3?routing=1&refresh
{
  "id":"m3",
  "title": "This is my 3rd Movie",
  "movie_name": "Third Movie",
  "film_to_franchise": {
    "name": "film",
    "parent": "fr2"
  }
}

#put cast under movies
PUT series/movie/c1?routing=1&refresh
{
  "id":"c1",
  "title": "Reema",
  "cast_name": "Reema Khan",
  "film_to_franchise": {
    "name": "cast",
    "parent": "m1"
  }
}

PUT series/movie/c2?routing=1&refresh
{
  "id":"c2",
  "title": "Arshad Khan",
  "cast_name": "Arshad Warsi",
  "film_to_franchise": {
    "name": "cast",
    "parent": "m1"
  }
}
#all searching
GET series/movie/_search
{
  "size":100
}
#search movies under franchise
GET series/movie/m1
GET series/movie/_search
{
  "query": {
    "has_parent": {
      "parent_type": "franchise",
      "query": {
        "match": {
          "franchise_name": "franchise"
        }
      }
    }
  }
}
#getting those movies whom franchise is not private
GET series/movie/_search
{
  "query": {
    "has_parent": {
      "parent_type": "franchise",
      "query": {
        "term": {
          "is_private": true
        }
      }
    }
  }
}
GET series/movie/_search
{
  "query": {
    "has_parent": {
      "parent_type": "franchise",
      "query": {
        "match": {
          "title": "Star"
        }
      }
    }
  }
}
GET series/movie/_search
{
  "_source": ["id","title","movie_name","film_to_franchise"], 
  "query": {
    "has_parent": {
      "parent_type": "franchise",
      "inner_hits" : {
        "_source":["title","franchise_name"]
      },
      "query": {
        "terms": {
          "id": ["fr1","fr2"]
        }
      }
    }
  }
}

GET series/movie/_search
{
  "query": {
    "parent_id": {
      "type": "film",
      "id": "fr1"
    }
  }
}

#search franchises under movie
GET series/movie/_search
{
  "query": {
    "has_child": {
      "type": "film",
      "query": {
        "term": {
          "movie_name": "Third"
        }
      }
    }
  }
}

#only franchises
GET series/movie/_search
{
  "query": {
    "bool": {
      "must": {
        "term": {
          "film_to_franchise": "franchise"
        }
      }
    }
  }
}
#only movies
GET series/movie/_search
{
  "query": {
    "bool": {
      "must": {
        "term": {
          "film_to_franchise": "film"
        }
      }
    }
  }
}
#only casts
GET series/movie/_search
{
  "query": {
    "bool": {
      "must": {
        "term": {
          "film_to_franchise": "cast"
        }
      }
    }
  }
}