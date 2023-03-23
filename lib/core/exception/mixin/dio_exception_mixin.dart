import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../failure.dart';

mixin DioExceptionMixin {
  Future<T> callApi<T>(FutureOr<T> Function() call) async {
    try {
      return await call();
    } on DioError catch (e, s) {
      if (e.error is TimeoutException) {
        throw Failure(
          message: 'Request timeout',
          statusCode: null,
          exception: e,
          stackTrace: s,
        );
      }
      if (e.error is SocketDirection) {
        throw Failure(
          message: e.message,
          statusCode: e.response?.statusCode,
          exception: e,
          stackTrace: s,
        );
      }

      if (e.response?.statusCode == 401) {
        throw Failure(
          message: e.response?.data['error'].toString() ?? '',
          statusCode: e.response?.statusCode,
          exception: e,
          stackTrace: s,
        );
      }

      if (e.response?.statusCode == 422) {
        throw Failure(
          message: e.response?.data['message'].toString() ?? '',
          statusCode: e.response?.statusCode,
          exception: e,
          stackTrace: s,
        );
      }

      if (e.response?.statusCode == 500) {
        throw Failure(
          message: e.response?.data['message'].toString() ?? '',
          statusCode: e.response?.statusCode,
          exception: e,
          stackTrace: s,
        );
      }

      throw Failure(
        message: e.response?.statusMessage ??
            'Something went wrong, Please try later'.hardcoded,
        statusCode: e.response?.statusCode,
        exception: e,
        stackTrace: s,
      );
    }
  }
}
