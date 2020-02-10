class Comment {

  String author;
  String content;
  String updateTime;

  Comment.fromJson(Map<String, dynamic> json)
    : author = json['author'] as String,
      content = json['content'] as String,
      updateTime = json['updateTime'] as String;

}