Delete question_answers

DELETE series

PUT series
{
  "mappings": {
    "movie": {
      "properties": {
        "film_to_franchise": {
          "type": "join",
          "relations": {
            "franchise": "film"
          }
        },
        "id": {
          "type": "text"
        },
        "genre":{
          "type": "text",
          "index": true
        },
        "title":{
           "type": "text",
          "index": true
        },
        "question_text": {
          "type": "text",
          "index": true
        },
        "answer_text": {
          "type": "text",
          "index": true
        }
      }
    }
  }
}
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
PUT series/movie/q1?refresh
{
  "question_text": "This is a question",
  "film_to_franchise": {
    "name": "franchise" 
  }
}
DELETE series/movie/12
PUT series/movie/12?routing=1&refresh 
{
  
  "film_to_franchise": {
    "name": "franchise" 
  },
  "id":"12",
  "title": "This is a ali frenchise1"
}
PUT series/movie/q2?refresh
{
  "question_text": "This is a another question",
  "film_to_franchise": {
    "name": "franchise"
  }
}


PUT series/movie/a1?routing=1&refresh 
{
  "answer_text": "This is an answer",
  "film_to_franchise": {
    "name": "film", 
    "parent": "12" 
  }
}

PUT series/movie/a2?routing=1&refresh
{
  "answer_text": "This is another answer",
  "film_to_franchise": {
    "name": "film",
    "parent": "q1"
  }
}
GET series/movie/_search
GET series/movie/_search
{
  "query": {
    "has_parent": {
      "parent_type": "franchise",
      "query": {
        "match": {
          "title": "Its ali Frenchise"
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
        "term": {
          "id": "12"
        }
      }
    }
  }
}
GET series/movie/_search
{
  "query": {
    "has_child": {
      "type": "film",
      "query": {
        "term": {
          "question_text": "This"
        }
      }
    }
  }
}

