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

  //返回的是Response
  static Future<Response> get(String url,{Map<String, dynamic>? queryParameters}) async{
    return await _sendRequest(HttpMethod.GET, url,queryParameters: queryParameters);
  }

  static Future<Response> post(String url,{Map<String, dynamic>? queryParameters,dynamic data}) async {
    return await _sendRequest(HttpMethod.POST, url,queryParameters: queryParameters,data: data);
  }

  static Future _sendRequest(HttpMethod method,String url,{Map<String, dynamic>? queryParameters,dynamic data}) async {
    try{
      switch(method) {
        case HttpMethod.GET:
          return HttpManager._getDioInstance()!.get(url,queryParameters: queryParameters);
        case HttpMethod.POST:
          return HttpManager._getDioInstance()!.post(url,queryParameters: queryParameters);
        default:
          throw Exception('请求方式错误');
      }
    } on DioError catch(e) {
      print(e.message);
    } on Exception catch(e) {
      print(e.toString());
    }
  }
}
