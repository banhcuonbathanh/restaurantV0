import 'package:dio/dio.dart';

class NetworkServiceInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    // options.headers['Accept-Language'] = 'en';
    // options.headers["Authorization"] =
    //     "1c15a46d7a4728cb6f784a795f544348298ad88e622e2f5b9f26d05432a97ef4n";
    super.onRequest(options, handler);
  }
}
