import 'package:bloc/bloc.dart';
import 'package:state_management2/containers/bloc/events/comments_event.dart';
import 'package:state_management2/containers/bloc/states/comments_state.dart';
import 'package:state_management2/models/common/models/comment_model.dart';
import 'package:state_management2/services/http_service.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {

  @override
  CommentsState get initialState => CommentsState(comments: const []);

  @override
  Stream<CommentsState> mapEventToState(CommentsEvent event) async* {
    if (event is GetComments) {
      final List<Comment> comments = await HttpService.getComments(event.articleId);
      yield CommentsState(comments: comments);
    }
    else if (event is AddComment) {
      final bool isSuccess = await HttpService.addComment(event.newItem);
      if (isSuccess) {
        yield CommentsState(comments: state.comments);
      }
    }
  }

}