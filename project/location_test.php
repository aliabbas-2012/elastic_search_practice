<?php 

$inputs = array
(
    'api_key' => 'cifkHDgcUlFGaboiRFR4kwrzZcxvwzO',
    'Location' => array
        (
            'longitude' => 74,
            'latitude' => 31
        ),

    'User' => array
        (
            'id' => 2
        ),

    'query' =>  ''
);
$search_key = isset($inputs['query']) ? trim($inputs['query']) : "";
$data = ElasticSearchPost::getInstance()->getNearPlacesList($search_key, $inputs['User']['id'], $inputs['Location']['longitude'], $inputs['Location']['latitude']);
?>