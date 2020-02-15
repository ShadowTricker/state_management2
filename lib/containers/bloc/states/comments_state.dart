import 'package:meta/meta.dart';
import 'package:state_management2/models/common/models/comment_model.dart';

class CommentsState {

  final List<Comment> comments;

  CommentsState({ @required this.comments });

}