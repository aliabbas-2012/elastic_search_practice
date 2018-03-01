HashSet hs1 = new HashSet();
HashSet hs2 = new HashSet();
if (ctx._source.id == params.user_id) {
    List x1 = ctx._source.followings;
    hs1.addAll(x1);
    hs1.remove(params.block_user_id);

    x1.clear();
    x1.addAll(hs1);
    ctx._source.followings = x1;

    List x2 = ctx._source.followers;
    hs2.addAll(x2);
    hs2.remove(params.block_user_id);

    x2.clear();
    x2.addAll(hs2);
    ctx._source.followings = x2;

} else if (ctx._source.id == params.block_user_id) {
    List x1 = ctx._source.followings;
    hs1.addAll(x1);
    hs1.remove(params.user_id);

    x1.clear();
    x1.addAll(hs1);
    ctx._source.followings = x1;

    List x2 = ctx._source.followers;
    hs2.addAll(x2);
    hs2.remove(params.user_id);

    x2.clear();
    x2.addAll(hs2);
    ctx._source.followings = x2;
}