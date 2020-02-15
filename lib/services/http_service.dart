import 'package:dio/dio.dart';
import 'package:state_management2/models/common/models/article_model.dart';
import 'package:state_management2/models/common/models/comment_model.dart';

class HttpService {

  static final String ip = '192.168.0.100';

  static Dio dio = Dio();

  /* Options options;
  get() async {
    Map<String, String> headers = HashMap();
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
    }
  } */

  static Future<List<Article>> getArticles() async {
    final response = await HttpService.dio.get('http://$ip:4004/article-list');
    final ResultData resultData = ResultData(response.data['data']);
    final List<Article> articles = resultData.data.map<Article>((data) => Article.fromJson(data)).toList();
    return articles;
  }

  static Future<List<Comment>> getComments(int articleId) async {
    final response = await HttpService.dio.post(
      'http://$ip:4004/comment-list',
      data: { 'articleId': articleId }
    );
    final ResultData resultData = ResultData(response.data['data']);
    final List<Comment> comments = resultData.data.map<Comment>((data) => Comment.fromJson(data)).toList();
    return comments;
  }

  static Future<bool> addArticle(Map<String, dynamic> newArticle) async {
    final response = await HttpService.dio.post(
      'http://$ip:4004/article/add',
      data: newArticle
    );
    if (response.data['status'] == 'SUCCESS') {
      return true;
    }
    return false;
  }

  static Future<bool> addComment(Map<String, dynamic> newComment) async {
    final response = await HttpService.dio.post(
      'http://$ip:4004/comment/add',
      data: newComment
    );
    if (response.data['status'] == 'SUCCESS') {
      return true;
    }
    return false;
  }
}

class ResultData {

  var data;

  ResultData(this.data);

}