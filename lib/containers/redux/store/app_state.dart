import 'package:state_management2/containers/redux/models/article_model.dart';

class AppState {
  bool isFetching;
  List<Article> articles;
  Exception error;

  AppState({
    this.isFetching = false,
    this.articles = const [],
    this.error
  });
}