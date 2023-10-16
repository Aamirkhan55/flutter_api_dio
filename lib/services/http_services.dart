import 'package:dio/dio.dart';

class HttpServices {
   late Dio _dio;

  final baseUrl = 'https://reqres.in/';

  HttpServices() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl
      )
    );

    initializeInterceptors();
  }

  Future<Response> getRequest (String, endPoint) async{
    Response response;
    try {
      response = await _dio.get(endPoint);
    } on DioException catch (e) {
      e.message;
      throw Exception(e.message);
      
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        //Error
        onError: (e, handler) {
          e.error;
        },

        //Request
        onRequest: (options, handler) {
          ('${options.method}, ${options.path}');
        },

        // Response
        onResponse: (e, handler) {
          e.data;
        }, 
        )
    );
  }
}