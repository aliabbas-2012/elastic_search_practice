if(params._source.is_post_location){
	double R = 6371; // km
	double dLat = Math.toRadians(params._source.post_location.latitude-params.latitude);
	double dLon = Math.toRadians(params._source.post_location.longitude-params.longitude);
	double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
	        Math.cos(Math.toRadians(params.latitude)) * Math.cos(Math.toRadians(params._source.post_location.latitude)) * 
	        Math.sin(dLon/2) * Math.sin(dLon/2); 
	double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
	return R * c;  

}
return 55555544;


if(params._source.is_post_location){double R=6371;double dLat=Math.toRadians(params._source.post_location.latitude-params.latitude);double dLon=Math.toRadians(params._source.post_location.longitude-params.longitude);double a=Math.sin(dLat/2)*Math.sin(dLat/2)+
Math.cos(Math.toRadians(params.latitude))*Math.cos(Math.toRadians(params._source.post_location.latitude))*Math.sin(dLon/2)*Math.sin(dLon/2);double c=2*Math.atan2(Math.sqrt(a),Math.sqrt(1-a));return R*c;}
return 55555544;