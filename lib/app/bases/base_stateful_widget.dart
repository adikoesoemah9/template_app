import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_app/app/bases/base_app.dart';
import 'package:base_app/app/bases/base_view_model.dart';
import 'package:base_app/helper/extensions/context_ext.dart';

abstract class BaseStatefulWidget extends ConsumerStatefulWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<ConsumerStatefulWidget extends BaseStatefulWidget,
        ViewModel extends BaseViewModel>
    extends ConsumerState<ConsumerStatefulWidget>
    with WidgetsBindingObserver, BaseApp {
  late ViewModel viewModel;

  var isArgsLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void onBuild({AutoDisposeChangeNotifierProvider<ViewModel>? provider}) {
    if (provider != null) viewModel = ref.watch(provider);
    if (!isArgsLoaded) {
      Future(() {
        setArgsValue();
      });
      isArgsLoaded = true;
    }
  }

  void setArgsValue() {}

  void validate<T>(T? value, Function(T value) unit) {
    if (value != null) {
      Future(() {
        unit(value);
      });
    }
  }

  T? args<T>(String name) {
    return cast<T>(context.arguments()?[name]);
  }
}
