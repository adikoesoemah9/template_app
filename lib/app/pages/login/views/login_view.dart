import 'package:flutter/material.dart';
import 'package:base_app/app/bases/base_stateful_widget.dart';
import 'package:base_app/app/pages/login/viewModels/login_view_model.dart';
import 'package:base_app/helper/extensions/context_ext.dart';
import 'package:base_app/app/values/app_color.dart';

class LoginView extends BaseStatefulWidget {
  static const routeName = '/login';

  static void navigate(BuildContext context) {
    context.pushAndRemoveFade(const LoginView());
  }

  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends BaseState<LoginView, LoginViewModel> {
  @override
  Widget build(BuildContext context) {
    onBuild(provider: loginViewModel);

    return const Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [],
      ),
    );
  }
}
