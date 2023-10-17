import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_app/app/bases/base_app.dart';
import 'package:base_app/helper/utils/app_util.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

abstract class BaseViewModel extends ChangeNotifier with BaseApp {
  final AutoDisposeChangeNotifierProviderRef ref;

  BaseViewModel(this.ref);

  var disposed = false;
  var disposedToken = CancelToken();
  var jobCode = 0;

  void notify() {
    if (disposed) return;
    notifyListeners();
  }

  @override
  void dispose() {
    disposed = true;
    disposedToken.cancel();
    super.dispose();
  }

  int resetJobCode() {
    disposedToken.cancel();
    if (!disposed) disposedToken = CancelToken();
    var code = AppUtil.jobCode();
    jobCode = code;
    return code;
  }
}

class Wrapper<T> {
  T value;
  Wrapper(this.value);

  map(MultiSelectItem Function(dynamic listTags) param0) {}
}

extension AppWrapper<T> on Wrapper<T> {
  alter(BaseViewModel base, T value) {
    this.value = value;
    base.notify();
  }

  end(BaseViewModel base) {
    if (isNullable) {
      value = null as T;
      base.notify();
    }
  }

  bool get isNullable {
    try {
      null as T;
      return true;
    } catch (_) {
      return false;
    }
  }
}

extension AppStateProvider<T> on AutoDisposeStateProvider<T> {
  alter(BaseViewModel base, T value) {
    base.ref.watch(notifier).state = value;
  }
}
