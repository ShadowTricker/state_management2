import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management2/containers/redux/models/article_model.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';
import 'package:state_management2/services/http_service.dart';

class FetchArticlesAction {}

class FetchArticlesSucceedAction {
  final List<Article> articles;

  FetchArticlesSucceedAction(this.articles);
}

class FetchArticlesFailedAction {
  final Exception error;

  FetchArticlesFailedAction(this.error);
}

/* ThunkAction<AppState> getArticles() {
  return (Store<AppState> store) async {
    final List<Article> articles = await HttpService.getArticles();
    store.dispatch(FetchArticlesSucceedAction(articles));
  };
} */

ThunkAction<AppState> getArticles(int secondsToWait) {
  return (Store<AppState> store) async {
    final List<Article> articles = await HttpService.getArticles();
    store.dispatch(FetchArticlesSucceedAction(articles));
  };
}

void fetchAction(Store<AppState> store) async {
  final List<Article> articles = await HttpService.getArticles();
  store.dispatch(FetchArticlesSucceedAction(articles));
}