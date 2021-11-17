import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

enum HttpMethod { GET,POST }

class HttpManager{

//  创建Dio单例
  static Dio? _dioInstance;
  static Dio? _getDioInstance() {
    _dioInstance ??= Dio();
    return _dioInstance;
  }

  static Future<Response> get(String url) {
    return Dio().get(url);
  }
}
