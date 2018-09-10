Map posts = new HashMap();
for (int i = 0; i < params.posts.size(); i++) {
 Map loc = new HashMap();
 loc.put(params.loc.lat, params.posts.get(i).lat);
 loc.put(params.loc.lon, params.posts.get(i).lat);
 posts.put(params.posts.get(i).id, loc);
}
for (int i = 0; i < ctx._source.box_posts.size(); i++) {
 int post_id = ctx._source.box_posts.get(i).id;
 if (posts.containsKey(post_id)) {
  ctx._source.box_posts.get(i).created_location = posts.get(post_id);
 }
}