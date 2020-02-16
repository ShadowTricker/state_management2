import 'package:redux/redux.dart';
import 'package:state_management2/containers/redux/actions/add_article.dart';
import 'package:state_management2/containers/redux/actions/fetch_articles.dart';
import 'package:state_management2/models/common/models/article_model.dart';

List<Article> getArticlesReducer(List<Article> articles, FetchArticlesSucceedAction action) {
    return action.articles;
}

List<Article> addArticleReducer(List<Article> articles, AddArticleAction action) {
    return articles;
}

Reducer<List<Article>> articlesReducer = combineReducers<List<Article>>([
  TypedReducer<List<Article>, FetchArticlesSucceedAction>(getArticlesReducer),
  TypedReducer<List<Article>, AddArticleAction>(addArticleReducer),
]);