import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../common/widget/button/primary_button.dart';
import '../../controller/sign_up_controller.dart';

class SignUpButtonWidget extends ConsumerWidget {
  final VoidCallback onPressed;
  const SignUpButtonWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(signUpControllerProvider.select((value) => value.isLoading));
    return PrimaryButton(
      text: 'SignUp',
      isEnabled: isLoading ? false : true,
      isLoading: isLoading,
      onPressed: onPressed,
    );
  }
}
