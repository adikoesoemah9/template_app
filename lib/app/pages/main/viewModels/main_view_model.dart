import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_app/app/bases/base_view_model.dart';

final mainViewModel = ChangeNotifierProvider.autoDispose((ref) {
  return MainViewModel(
    ref: ref,
  );
});

class MainViewModel extends BaseViewModel {
  MainViewModel({
    required ref,
  }) : super(ref) {
    _init();
  }

  void _init() async {}
}
