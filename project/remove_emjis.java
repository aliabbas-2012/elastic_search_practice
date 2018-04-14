String pattren =  "[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]";
String utf = "UTF-8";
String replace = " ";
String startString = "";

String removeEmojiAndSymbolFromString(String content,String pattren,String utf,String replace,String startString) {
    String utf8tweet = startString;
    try {
        byte[] utf8Bytes = content.getBytes(utf);
        utf8tweet = new String(utf8Bytes, utf);
    } catch (UnsupportedEncodingException e) {
        return startString;
    }
    Pattern unicodeOutliers = Pattern.compile(pattren,Pattern.UNICODE_CASE |Pattern.CANON_EQ |Pattern.CASE_INSENSITIVE);
    Matcher unicodeOutlierMatcher = unicodeOutliers.matcher(utf8tweet);
    utf8tweet = unicodeOutlierMatcher.replaceAll(replace);
    return utf8tweet
}


String pattren="[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]";String utf="UTF-8";String removeEmojiAndSymbolFromString(String content,String pattren,String utf){String utf8tweet="";try{byte[]utf8Bytes=content.getBytes(utf);utf8tweet=new String(utf8Bytes,utf);}catch(UnsupportedEncodingException e){e.printStackTrace();}
Pattern unicodeOutliers=Pattern.compile(pattren,Pattern.UNICODE_CASE|Pattern.CANON_EQ|Pattern.CASE_INSENSITIVE);Matcher unicodeOutlierMatcher=unicodeOutliers.matcher(utf8tweet);utf8tweet=unicodeOutlierMatcher.replaceAll(" ");return utf8tweet}


"A 🐱, 🐱 and a 🐭 became friends. For 🐶's birthday party, they all had 🍔s, 🍟s, 🍪s and 🍰."


Pattern pattern = Pattern.compile(params.pattern1);Matcher matcher = pattern.matcher(params.s);return matcher.replaceAll(params.replace);