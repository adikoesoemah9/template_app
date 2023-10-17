import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_app/app/bases/base_view_model.dart';

final splashViewModel = ChangeNotifierProvider.autoDispose((ref) {
  return SplashViewModel(
    ref: ref,
  );
});

class SplashViewModel extends BaseViewModel {
  SplashViewModel({
    required ref,
  }) : super(ref) {
    initData();
  }

  void initData() async {}
}
