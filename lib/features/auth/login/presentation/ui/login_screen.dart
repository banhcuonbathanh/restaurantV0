import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restauranttdd0/common/extensions/string_hardcoded.dart';
import 'package:restauranttdd0/features/auth/login/presentation/ui/widget/login_button_widget.dart';
import 'package:restauranttdd0/features/auth/login/presentation/ui/widget/login_password_widget.dart';

import '../../../../../common/class/break_point.dart';
import '../../../../../common/mixin/input_validation_mixin.dart';
import '../../../../../common/provider/utility_provider/utilityProvider.dart';
import '../../../../../common/styles/dimens.dart';
import '../../../../../common/widget/app_scaffold.dart';
import '../../../../../common/widget/form/custom_text_form_field.dart';

import '../../../login/presentation/controller/login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String? from;
  const LoginScreen({this.from, Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with InputValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(AbstractUtilityProvider.appConfig.notifier)
          .initAppConfig(context: context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: const Text('Login'),
      widget: Center(
        child: SizedBox(
          width: BreakPoint.tablet,
          child: Padding(
            padding: const EdgeInsets.all(kSmall),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: kMedium,
                    ),
                    // const LoginErrorWidget(),
                    const SizedBox(
                      height: kMedium,
                    ),
                    CustomTextFormField(
                      labelText: 'Email'.hardcoded,
                      hintText: 'Enter your email'.hardcoded,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      prefixIcon: const Icon(Icons.email),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _emailController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                      validator: combine([
                        withMessage(
                          'email is empty'.hardcoded,
                          isTextEmpty,
                        ),
                        withMessage(
                          'email is invalid'.hardcoded,
                          isInvalidEmail,
                        )
                      ]),
                      onChanged: (String? value) {
                        ref
                            .read(
                              loginControllerProvider.notifier,
                            )
                            .setFormData(key: 'email', value: value);

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: kMedium,
                    ),
                    LoginPasswordWidget(
                      passwordController: _passwordController,
                      labelText: 'Password'.hardcoded,
                      hintText: 'Please enter your password'.hardcoded,
                      formKey: 'password'.hardcoded,
                      validators: [
                        withMessage('password is empty', isTextEmpty),
                        withMessage('invalid password', isPasswordInvalid)
                      ],
                    ),
                    const SizedBox(
                      height: kMedium,
                    ),
                    LoginButtonWidget(onPressed: _login),
                    const SizedBox(
                      height: kMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        const SizedBox(
                          width: kMedium,
                        ),
                        GestureDetector(
                          onTap: () =>
                              GoRouter.of(context).push('/login/signUp'),
                          child: const Text("Register Now!"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    // ref.read(goRouterNotifierProvider).isLoggedIn = true;
    ref.read(loginControllerProvider.notifier).login();
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      ref.read(loginControllerProvider.notifier).login();
    }
  }
}
