import 'dart:async';
import 'package:flutter/material.dart';
import 'package:base_app/app/bases/base_stateful_widget.dart';
// import 'package:base_app/app/pages/login/views/login_view.dart';
import 'package:base_app/app/pages/main/views/main_view.dart';
import 'package:base_app/app/pages/splash/viewModels/splash_view_model.dart';
import 'package:base_app/app/values/app_color.dart';
import 'package:base_app/helper/extensions/context_ext.dart';

class SplashView extends BaseStatefulWidget {
  static const routeName = '/splash';

  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends BaseState<SplashView, SplashViewModel> {
  Timer? _navigateTimer;

  @override
  Widget build(BuildContext context) {
    onBuild(provider: splashViewModel);
    _setUserViews();

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: SizedBox(
          width: context.width * 0.75,
          child: Image.asset("assets/logo/maximize.png"),
        ),
      ),
    );
  }

  void _setUserViews() {
    _navigateTimer ??= Timer(const Duration(seconds: 2), () async {
      _navigateToLogin();
    });
  }

  void _navigateToLogin() {
    Future.delayed(const Duration(milliseconds: 500), () {
      // LoginView.navigate(context);
      MainView.navigate(context);
    });
  }

  // void _navigateToMain() {
  //   MainView.navigate(context);
  // }
}
