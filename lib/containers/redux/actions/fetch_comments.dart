import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:state_management2/containers/redux/models/comment_model.dart';
import 'package:state_management2/containers/redux/store/app_state.dart';
import 'package:state_management2/services/http_service.dart';


class FetchCommentsSucceedAction {
  final List<Comment> comments;

  FetchCommentsSucceedAction(this.comments);
}

ThunkAction<AppState> getComments(int articleId) {
  return (Store<AppState> store) async {
    final List<Comment> comments = await HttpService.getComments(articleId);
    store.dispatch(FetchCommentsSucceedAction(comments));
  };
}