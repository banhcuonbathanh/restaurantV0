import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/app_const_data/app_const_data.dart';

import 'network_service_interceptor.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: AppConstData.BaseURL,
    connectTimeout: 1000 * 60,
    sendTimeout: 1000 * 60,
    receiveTimeout: 1000 * 60,
  );

  final _dio = Dio(options)
    ..interceptors.addAll([
      // HttpFormatter(),
      NetworkServiceInterceptor(),
    ]);

  return _dio;
});


 // _dio.getUri('https://gorest.co.in/');
  // var response = _dio.get('http://ip-api.com/json/24.48.0.1');
  // var response = _dio.get('https://gorest.co.in/public/v2/users/652');
  // print(response.then((value) {
  //   print('this from response networkServiceProvider');
  //   print(value);
  // }));
  // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //     ((client) {
  //   final SecurityContext context = SecurityContext();
  //   client.badCertificateCallback =
  //       (X509Certificate cert, String host, int port) => false;

  //   return HttpClient(context: context);
  // });