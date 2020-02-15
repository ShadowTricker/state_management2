import 'package:redux/redux.dart';
import 'package:state_management2/containers/redux/actions/add_article.dart';
import 'package:state_management2/containers/redux/actions/fetch_articles.dart';
import 'package:state_management2/models/common/models/article_model.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';

/* AppState articleReducer(AppState state, action) {
  if (action is FetchArticlesAction) {
    return AppState(
      articles: state.articles,
      isFetching: true,
      error: null
    );
  }
  else if (action is FetchArticlesSucceedAction) {
    return AppState(
      articles: action.articles,
      isFetching: false,
      error: null
    );
  } 
  else if (action is FetchArticlesFailedAction) {
    return AppState(
      articles: const [],
      isFetching: false,
      error: action.error
    );
  }

  return state;
} */

List<Article> getArticlesReducer(List<Article> articles, FetchArticlesSucceedAction action) {
    return action.articles;
}

List<Article> addArticleReducer(List<Article> articles, AddArticleAction action) {
    return articles;
}

Reducer<List<Article>> articlesReducer = combineReducers<List<Article>>([
  TypedReducer<List<Article>, FetchArticlesSucceedAction>(getArticlesReducer),
  TypedReducer<List<Article>, AddArticleAction>(addArticleReducer),
]);