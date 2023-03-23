import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';

import '../../../../../../common/widget/button/primary_button.dart';
import '../../controller/login_controller.dart';

class LoginButtonWidget extends ConsumerWidget {
  final VoidCallback onPressed;
  const LoginButtonWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(loginControllerProvider.select((value) => value.isLoading));
    return PrimaryButton(
      text: 'LogIn'.hardcoded,
      isEnabled: isLoading ? false : true,
      isLoading: isLoading,
      onPressed: onPressed,
    );
  }
}
