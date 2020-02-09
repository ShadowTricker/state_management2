class Article {

  int articleId;
  String title;
  String author;
  String content;

  Article.fromJson(Map<String, dynamic> json)
    : articleId = json['articleId'] as int,
      title = json['title'] as String,
      author = json['author'] as String,
      content = json['content'] as String;

}