import 'package:dio/dio.dart';

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
    final response = await dio.get('http://192.168.0.100:4004/article-list');
    return ResultData(response.data['data']);
    
  }
}

class ResultData {

  var data;

  ResultData(this.data);

}