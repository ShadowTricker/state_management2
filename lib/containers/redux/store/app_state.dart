import 'package:state_management2/models/common/models/article_model.dart';
import 'package:state_management2/models/common/models/comment_model.dart';

/* class AppState {
  bool isFetching;
  List<Article> articles;
  Exception error;

  AppState({
    this.isFetching = false,
    this.articles = const [],
    this.error
  });
} */

class AppState {
  String author;
  List<Article> articles;
  List<Comment> comments;

  AppState({
    this.author,
    this.articles = const [],
    this.comments = const [],
  });
}