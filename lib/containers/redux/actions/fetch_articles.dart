import 'package:state_management2/containers/redux/models/article_model.dart';

class FetchArticlesAction {}

class FetchArticlesSucceedAction {
  final List<Article> articles;

  FetchArticlesSucceedAction(this.articles);
}

class FetchArticlesFailedAction {
  final Exception error;

  FetchArticlesFailedAction(this.error);
}