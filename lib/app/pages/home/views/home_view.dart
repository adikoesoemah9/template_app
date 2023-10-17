import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base_app/app/bases/base_stateful_widget.dart';
import 'package:base_app/app/styles/app_app_bar.dart';
import 'package:base_app/app/styles/app_widget.dart';
import 'package:base_app/app/pages/home/viewModels/home_view_model.dart';
import 'package:base_app/app/values/app_color.dart';
import 'package:base_app/helper/extensions/context_ext.dart';
import 'package:base_app/helper/extensions/widget_ext.dart';
import 'package:base_app/app/widgets/pull_to_refresh.dart';

class HomeView extends BaseStatefulWidget {
  static const routeName = '/home';

  static void navigate(BuildContext context) {
    context.pushNamed(routeName: routeName);
  }

  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends BaseState<HomeView, HomeViewModel> {
  var _scrollController = ScrollController();
  var _isAppBarVisible = false;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    onBuild(provider: homeViewModel);

    return Stack(
      children: [
        AppAppBar.hidden(
          backgroundColor: AppColor.white,
        ),
        Container(
          color: AppColor.desertStorm,
        ),
        PullToRefresh(
          scrollController: _scrollController,
          indicatorColor: AppColor.primary.withOpacity(0.75),
          positionedTop: 108.h,
          isOneChild: true,
          onRefresh: () async {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppWidget.margin(height: 80.h),
              Stack(
                children: [
                  Column(
                    children: [
                      AppWidget.margin(
                        height: 120.h,
                      ),
                      Container(
                        height: 480.h,
                        color: AppColor.desertStorm,
                      ),
                    ],
                  ),
                  _content(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _content() {
    return Column(
      children: [
        Column(
          children: [
            AppWidget.margin(
              height: 250.h,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  AppWidget.margin(
                    height: 10.h,
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            AppWidget.margin(
              height: 250.h,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ).padSymmetric(
          horizontal: 20.w,
        ),
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        var offset = _scrollController.offset;

        if (offset <= 20 && _isAppBarVisible) {
          setState(() {
            _isAppBarVisible = false;
          });
        } else if (offset > 20 && !_isAppBarVisible) {
          setState(() {
            _isAppBarVisible = true;
          });
        }
      });
  }
}
