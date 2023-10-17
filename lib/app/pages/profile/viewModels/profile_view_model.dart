import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_app/app/bases/base_view_model.dart';

final profileViewModel = ChangeNotifierProvider.autoDispose((ref) {
  return ProfileViewModel(
    ref: ref,
  );
});

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel({
    required ref,
  }) : super(ref) {
    initData();
  }

  void initData() async {}
}
