import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/core/exception/mixin/dio_exception_mixin.dart';
import 'package:restauranttdd0/features/auth/login/data/api/login_api_service.dart';
import 'package:restauranttdd0/features/auth/login/data/dto/response/login_response.dart';

import 'ilogin_repository.dart';

final loginRepositoryProvider = Provider.autoDispose<ILoginRepository>((ref) {
  final loginApiService = ref.watch(loginApiServiceProvider);

  return LoginRepository(loginApiService);
});

class LoginRepository with DioExceptionMixin implements ILoginRepository {
  final LoginApiService _loginApiService;

  LoginRepository(this._loginApiService);

  @override
  Future<LoginResponse> login(Map<String, dynamic> request) async {
    // print('_loginApiService.login(request)sdfsaf');
    // print(await _loginApiService.login(request));
    return callApi<LoginResponse>(() => _loginApiService.login(request));
  }
}
