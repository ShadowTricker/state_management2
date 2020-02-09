import 'package:redux/redux.dart';
import 'package:state_management2/containers/redux/actions/article_action.dart';
import 'package:state_management2/containers/redux/store/articles_state.dart';

final articlesReducer = combineReducers<List<Article>>([
  TypedReducer<List<Article>, FetchArticlesAction>(_articlesReducer)
]);

List<Article> _articlesReducer(List<Article> state, FetchArticlesAction action) {
  if (action is FetchArticlesAction) {
    return action.articleList;
  }
  return state;
}