import 'package:meta/meta.dart';

abstract class CommentsEvent {}

class GetComments extends CommentsEvent {
  final int articleId;

  GetComments({ @required this.articleId });
}

class AddComment extends CommentsEvent {
  final Map<String, dynamic> newItem;
  AddComment({ @required this.newItem });
}