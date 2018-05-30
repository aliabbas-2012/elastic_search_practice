<?php
[
    "conflicts" =>"proceed",
    "script"=> [
        "source"=> "List x=ctx._source.boxes;String old_name;for(int i=0;i<x.size();i++)[if(x.get(i).id.equals(params.box_id))[old_name=x.get(i).name;x.remove(i);]]ctx._source.boxes=x;HashSet hs=new HashSet();List xt=ctx._source.tag_keywords;xt.removeIf(Objects::isNull);xt.replaceAll(String::toLowerCase);hs.addAll(xt);hs.remove(old_name.toLowerCase());xt.clear();xt.addAll(hs);ctx._source.tag_keywords=xt;",
        "lang"=> "painless",
        "params"=> [
            "box_id"=> box_id
        ]
    ],
    "query"=>[
        "bool"=> [
            "must"=> [
                [
                    "nested"=> [
                        "path"=> "boxes",
                        "query"=> [
                            "bool"=> [
                                "must"=> [
                                    "term"=>[
                                        "boxes.id"=> box_id
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
]


57649


183022

sudo a2dismod php7.0 ; sudo a2enmod php5 ; sudo service apache2 restart
sudo update-alternatives --set php /usr/bin/php5