
GET /users/user/_search
{
    "from":5000,
    "size":1000,
    "_source": ["id","username","pin.location","login_country_id","login_country_name"], 
    "sort" : [
        {
            "_geo_distance" : {
                "pin.location" : [74, 31],
                "order" : "asc",
                "unit" : "km",
                "mode" : "min",
                "distance_type" : "arc"
            }
        }
    ]
}