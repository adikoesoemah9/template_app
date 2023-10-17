import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_app/app/bases/base_view_model.dart';

final loginViewModel = ChangeNotifierProvider.autoDispose((ref) {
  return LoginViewModel(
    ref: ref,
  );
});

class LoginViewModel extends BaseViewModel {
  LoginViewModel({
    required ref,
  }) : super(ref) {
    _initData();
  }

  bool isJBroken = false;

  void _initData() async {
    try {} catch (e) {}
  }
}
