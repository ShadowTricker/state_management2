import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:state_management2/containers/redux/models/article_model.dart';
import 'package:state_management2/containers/redux/models/comment_model.dart';

class HttpService {

  Dio dio = Dio();
  Options options;

  get() async {
    /* Map<String, String> headers = HashMap();
    headers['Content-Type'] = 'application/json';
    options = Options(method: 'get');
    options.headers = headers;

    try {
      final response = await dio.request(
        'http://192.168.0.100:4004/article-list',
        options: options
      );
      print(response.data);
    } catch(e) {
      print(e.message);
    } */
  }

  getArticles() async {
    final response = await dio.get('http://10.243.27.196:4004/article-list');
    final ResultData resultData = ResultData(response.data['data']);
    final List<Article> articles = resultData.data.map<Article>((data) => Article.fromJson(data)).toList();
    return articles;
  }

  getComments(int articleId) async {
    final response = await dio.post(
      'http://10.243.27.196:4004/comment-list',
      data: { 'articleId': articleId }
    );
    final ResultData resultData = ResultData(response.data['data']);
    final List<Comment> comments = resultData.data.map<Comment>((data) => Comment.fromJson(data)).toList();
    return comments;
  }
}

class ResultData {

  var data;

  ResultData(this.data);

}