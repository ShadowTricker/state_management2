import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';

class SetAuthorAction {
  String author;

  SetAuthorAction(this.author);
}

/* ThunkAction setAuthor(String author) {
  return (Store<AppState> store) async {
    store.dispatch(SetAuthorAction(author));
  };
}

void fetchAction(Store<AppState> store) async {
  final List<Article> articles = await HttpService.getArticles();
  store.dispatch(FetchArticlesSucceedAction(articles));
} */