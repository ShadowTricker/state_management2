import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management2/models/common/models/article_model.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';
import 'package:state_management2/services/http_service.dart';

class FetchArticlesSucceedAction {
  final List<Article> articles;

  FetchArticlesSucceedAction(this.articles);
}

ThunkAction<AppState> getArticles() {
  return (Store<AppState> store) async {
    final List<Article> articles = await HttpService.getArticles();
    store.dispatch(FetchArticlesSucceedAction(articles));
  };
}