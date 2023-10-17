import 'package:base_app/helper/utils/app_util.dart';

class BaseApp {
  int get dateNow => DateTime.now().millisecondsSinceEpoch;

  T? cast<T>(x) => x is T ? x : null;

  String image(String? name) => AppUtil.image(name);

  bool isIos() => AppUtil.isIos();
}
