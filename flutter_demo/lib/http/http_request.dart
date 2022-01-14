import 'package:dio/dio.dart';
import '../config/env.dart';

var _dio;
class Request {
  // static Dio get instance => _getInstance();

  // static _getInstance() {
  //   if (instance == null) {
  //     instance == Dio();
  //   }
  //   return instance;
  // }

  static Dio dioBuilder() {
    if(_dio==null){
      _dio = Dio();
    }
    _dio.options.baseUrl = Env.BASE_URL;
    return _dio;
  }
}
