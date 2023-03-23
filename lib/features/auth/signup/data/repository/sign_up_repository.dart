import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/exception/mixin/dio_exception_mixin.dart';
import '../api/sign_up_api_service.dart';
import '../dto/sign_up_response.dart';
import 'isign_up_repository.dart';

/// provider to provide the instance of SignUpRepository
final signUpRepositoryProvider = Provider<ISignUpRepository>((ref) {
  final signUpApiService = ref.watch(signUpApiServiceProvider);

  return SignUpRepository(signUpApiService);
});

class SignUpRepository with DioExceptionMixin implements ISignUpRepository {
  final SignUpApiService _signUpApiService;

  SignUpRepository(this._signUpApiService);

  @override
  Future<SignUpResponse> signUp(Map<String, dynamic> request) async {
    return callApi<SignUpResponse>(() => _signUpApiService.signUp(request));
  }
}
