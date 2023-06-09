import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/sign_up_service.dart';
import '../state/sign_up_state.dart';

final signUpControllerProvider =
    NotifierProvider<SignUpController, SignUpState>(SignUpController.new);

class SignUpController extends Notifier<SignUpState> {
  @override
  SignUpState build() {
    return const SignUpState();
  }

  void signUp() async {
    final signUpService = ref.read(signUpServiceProvider);

    state = state.copyWith(isLoading: true, errorMsg: null);
    final result = await signUpService.signUp(state.formData);

    result.when(
      (success) {
        state = state.copyWith(
          isLoading: false,
          isSignUp: const AsyncValue.data(true),
        );
      },
      (error) {
        state = state.copyWith(
          isLoading: false,
          errorMsg: error.message,
        );
      },
    );
  }

  void setTermsAndCondition(bool value) {
    state = state.copyWith(isTermsAndCondition: value);
  }

  void setIsObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void setFormData({required String key, required dynamic value}) {
    state = state.copyWith(
      formData: {
        ...state.formData,
        ...{key: value}
      },
    );
  }
}
