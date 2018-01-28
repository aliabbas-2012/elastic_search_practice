GET /posts/_mappings
GET /users/_mappings
GET /posts/_search
{
  "query": {
    "match_all": {}
  }
}

GET posts/post/116143
GET posts/_count
GET users/user/18368
GET users/user/5