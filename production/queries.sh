#user count
curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/users/_count'

#post count
curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/posts/_count'


http://172.31.15.172:3002/post/index-nearest/?long=74&lat=31&user_id=8625


curl -XGET -H 'Content-Type: application/json'  'https://vpc-production1-new-node-js-d25dxb5wvxp5wwaih2qxwlqcve.us-west-2.es.amazonaws.com/posts/post/127789'