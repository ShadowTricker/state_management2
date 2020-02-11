import 'package:redux/redux.dart';
import 'package:state_management2/containers/redux/actions/fetch_articles.dart';
import 'package:state_management2/containers/redux/models/article_model.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';
import 'package:state_management2/services/http_service.dart';

void fetchArticlesMiddleware(
  Store<AppState> store,
  action,
  NextDispatcher next
) async {
  if (action is FetchArticlesAction) {
    try {
      final List<Article> articles = await HttpService.getArticles();
      store.dispatch(FetchArticlesSucceedAction(articles));
    } catch(e) {
      store.dispatch(FetchArticlesFailedAction(e));
    }
    
  }

  next(action);
}