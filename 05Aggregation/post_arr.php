<?php 

$d = array(
    'post_type_id' => 5,
    'user_id' => 2,
    'text_content' => 'test',
    'client_ip_address' => '127.0.0.1',
    'local_db_path' => 3015072727369,
    'client_ip_country_code' => '',
    'client_ip_country_name' => '',
    'client_ip_region_code' => '',
    'client_ip_region_name' => '',
    'client_ip_city' => '',
    'client_ip_zip_code' => '',
    'client_ip_time_zone' =>'' ,
    'client_ip_latitude' => '',
    'client_ip_longitude' => ''
);

$d = array(
    'post_type_id' => 5,
    'user_id' => 2,
    'text_content' => 'test',
    'client_ip_address' => '127.0.0.1',
    'local_db_path' => 3015072727369
);

$post_location  = [
    'fs_location_id' => 'ChIJmZNIDYkDLz4R1Z_nmBxNl7o',
    'location_name' => 'Riyadh',
    'latitude' => '26.3927',
    'longitude' => '49.9777',
    'location_id' => 72,
    'created_at' => Carbon::now()

];

$post_location = new PostLocation($post_location);
$post->post_locations()->saveMany([$post_location]);


$activities = array (
    'user_id' => 2,
    'user_is_live' => 1,
    'user_full_name' => 'Yahoo1',
    'username' => 'yahoo',
    'user_picture' => '9jhm63ydupload-image1508313040.jpg',
    'user_gender' => 0,
    'tag_user_id' => 9595,
    'tag_user_full_name' => 'Majo mike',
    'tag_username' => 'majo',
    'tag_user_picture' => 'rwls1p2jcropped507977901504873847.jpg',
    'action' => 'tagUser',
    'action_type' => 7,
    'post_id' => 125620,
    'post_type_id' => 5,
    'post_type' => 'Multimedia',
    'post_text_content' => 'test',
    'created_at' => Carbon::now(),

    'post_file' => 'vwyzggbsimgonline-com-ua-twotoone-qqqy9knqx7ay1517743799.jpg',
    'post_file_2' => 'as8bn3jnaafd8c6b005d1517750071.jpg'
);

$follow_activity = array (
    'user_id' => 18363,
    'profile_visited_id' => 5,
    'action' => 'follow',
    'action_type' => 2,
    'user_full_name' => 'Asif Ilsa' ,
    'username' => 'asif_ilsa',
    'user_picture' => 'ydi1dmtdupload-image1512648978.jpg',
    'user_is_live' => 1,
    'user_gender' => 1,
    'profile_visited_full_name' => 'Fahad AlSaud',
    'profile_visited_username' => 'fahad',
    'profile_visited_picture' => 'xpyadwiiupload-image1508557047.jpg',
    'post_id' => '',
    'comment_id' => '', 
    'created_at' => '2018-02-04 19:26:24'
);
