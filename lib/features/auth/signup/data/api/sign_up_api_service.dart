import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/remote/network_service.dart';
import '../dto/sign_up_response.dart';

part 'sign_up_api_service.g.dart';

/// provider for SignUpApiService
final signUpApiServiceProvider = Provider<SignUpApiService>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return SignUpApiService(dio);
});

@RestApi()
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio) => _SignUpApiService(dio);

  @POST('api/v1/register')
  Future<SignUpResponse> signUp(@Body() Map<String, dynamic> request);
}
