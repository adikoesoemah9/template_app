import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_app/app/bases/base_view_model.dart';

final homeViewModel = ChangeNotifierProvider.autoDispose((ref) {
  return HomeViewModel(
    ref: ref,
  );
});

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required ref,
  }) : super(ref) {
    initData();
  }

  initData() async {}
}
