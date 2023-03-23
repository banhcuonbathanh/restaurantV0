import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/sign_up_controller.dart';

class SignUpErrorWidget extends ConsumerWidget {
  const SignUpErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMsg =
        ref.watch(signUpControllerProvider.select((value) => value.errorMsg));

    if (errorMsg == null) {
      return const SizedBox.shrink();
    }

    return Center(
      child: Text(
        errorMsg,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.redAccent,
            ),
      ),
    );
  }
}
