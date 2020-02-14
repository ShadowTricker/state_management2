import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';
import 'package:state_management2/services/http_service.dart';

import 'fetch_comments.dart';


class AddCommentAction {
}

ThunkAction<AppState> addComment(Map<String, dynamic> newComment, int articleId) {
  return (Store<AppState> store) async {
    final bool isSuccess = await HttpService.addComment(newComment);
    if (isSuccess) {
      await store.dispatch(AddCommentAction());
      await store.dispatch(getComments(articleId));
    }
  };
}