import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';
import 'package:state_management2/services/http_service.dart';


class AddArticleAction {
}

ThunkAction<AppState> addArticle(Map<String, dynamic> newArticle) {
  return (Store<AppState> store) async {
    final bool isSuccess = await HttpService.addArticle(newArticle);
    if (isSuccess) {
      store.dispatch(AddArticleAction());
    }
  };
}