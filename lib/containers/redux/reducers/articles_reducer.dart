import 'package:state_management2/containers/redux/actions/fetch_articles.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';

AppState articleReducer(AppState state, action) {
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
}