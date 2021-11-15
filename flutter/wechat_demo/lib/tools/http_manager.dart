import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HttpManager{

  //创建Dio单例
  // static Dio _dioInstance;
  // static Dio getDioInstance() {
  //   if(!_dioInstance) {
  //     _dioInstance = Dio();
  //   }
  //   return _dioInstance;
  // }

  static Future<Response> get(String url) {
    return Dio().get(url);
  }
}
