class Comment {

  String author;
  String comment;
  String updateTime;

  Comment.fromJson(Map<String, dynamic> json)
    : author = json['author'] as String,
      comment = json['comment'] as String,
      updateTime = json['updateTime'] as String;

}