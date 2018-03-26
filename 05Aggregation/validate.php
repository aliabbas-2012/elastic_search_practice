<?php 

$input = array(
   'data' => array(
     'users' => ["user_id"=>18368,"blocked_user_id"=>5]
   )
);

$rules = ValidationRules::$test_rules;    
$v = Validator::make($input,$rules,Notifications::$error['blocked_you_or_you_blocked']);

$v->fails();
