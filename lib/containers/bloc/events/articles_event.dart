import 'package:meta/meta.dart';

abstract class ArticlesEvent {}

class GetArticles extends ArticlesEvent {}

class AddArticle extends ArticlesEvent {

  final Map<String, dynamic> newItem;
  AddArticle({ @required this.newItem });

}