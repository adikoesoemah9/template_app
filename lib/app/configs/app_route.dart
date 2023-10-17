import 'package:base_app/app/pages/splash/views/splash_view.dart';
import 'package:base_app/app/pages/home/views/home_view.dart';
import 'package:base_app/app/pages/main/views/main_view.dart';
import 'package:base_app/app/pages/login/views/login_view.dart';

class AppRoute {
  static final list = {
    SplashView.routeName: (context) => const SplashView(),
    HomeView.routeName: (context) => const HomeView(),
    LoginView.routeName: (context) => const LoginView(),
    MainView.routeName: (context) => const MainView(),
  };
}
