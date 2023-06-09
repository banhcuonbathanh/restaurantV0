import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/local/db/hive_box_key.dart';
import '../../../../../core/route/notifier/go_router_notifier.dart';

import '../../../login/presentation/state/login_state.dart';
import '../../application/login_service.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState build() {
    return const LoginState();
  }

  void login() async {
    final loginService = ref.read(loginServiceProvider);
    state = state.copyWith(
        isLoading: true, errorData: const AsyncValue.data(''), errorMsg: null);

    final result = await loginService.login(state.formData);

    result.when(
      (success) {
        state = state.copyWith(
          isLoading: false,
          isLoggedIn: const AsyncValue.data(true),
        );
        // update the state on isLoggedIn
        ref.read(goRouterNotifierProvider).isLoggedIn = success;
      },
      (error) {
        state = state.copyWith(
          isLoading: false,
          errorData: AsyncValue.error(
            error,
            error.stackTrace,
          ),
          errorMsg: error.message,
        );
      },
    );
  }

  void setIsObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void setFormData({required String key, required dynamic value}) {
    state = state.copyWith(formData: {
      ...state.formData,
      ...{key: value}
    });
  }

  void getAccessToken() async {
    final loginService = ref.read(loginServiceProvider);

    final result = await loginService.getFromBox<String?>(accessTokenKey);

    result.when(
      (success) {
        // update the state on isLoggedIn
        ref.read(goRouterNotifierProvider).isLoggedIn =
            success == null ? false : true;
      },
      (error) {
        state = state.copyWith(errorMsg: error.message);
      },
    );
  }
}
