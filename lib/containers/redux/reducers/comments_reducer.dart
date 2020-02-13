import 'package:redux/redux.dart';
import 'package:state_management2/containers/redux/actions/add_comment.dart';
import 'package:state_management2/containers/redux/actions/fetch_comments.dart';
import 'package:state_management2/containers/redux/models/comment_model.dart';

List<Comment> getCommentsReducer(List<Comment> comments, FetchCommentsSucceedAction action) {
    return action.comments;
}

List<Comment> addCommentReducer(List<Comment> comments, AddCommentAction action) {
    return comments;
}

Reducer<List<Comment>> commentsReducer = combineReducers<List<Comment>>([
  TypedReducer<List<Comment>, FetchCommentsSucceedAction>(getCommentsReducer),
  TypedReducer<List<Comment>, AddCommentAction>(addCommentReducer),
]);