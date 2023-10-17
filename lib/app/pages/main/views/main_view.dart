import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:base_app/app/bases/base_stateful_widget.dart';
import 'package:base_app/app/pages/main/viewModels/main_view_model.dart';
import 'package:base_app/app/pages/home/views/home_view.dart';
import 'package:base_app/app/pages/profile/views/profile_view.dart';
import 'package:base_app/app/values/app_color.dart';
import 'package:base_app/app/widgets/keep_alive_page.dart';
import 'package:base_app/app/styles/app_widget.dart';
import 'package:base_app/app/styles/app_text_styles.dart';
import 'package:base_app/helper/extensions/context_ext.dart';
import 'package:base_app/helper/extensions/widget_ext.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainView extends BaseStatefulWidget {
  static const routeName = '/main';
  static const homeView = 0;
  static const profileView = 1;

  static void navigate(BuildContext context) {
    context.pushAndRemoveFade(const MainView());
  }

  const MainView({Key? key}) : super(key: key);

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends BaseState<MainView, MainViewModel> {
  final _homeState = GlobalKey<HomeViewState>();
  final _profileState = GlobalKey<ProfileViewState>();
  final _pvIndicatorController = PageController();

  var _pvController = PageController();
  var _page = MainView.homeView;

  @override
  Widget build(BuildContext context) {
    onBuild(provider: mainViewModel);

    return FocusDetector(
      child: Scaffold(
        backgroundColor: AppColor.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            PageView(
              controller: _pvIndicatorController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(),
                Container(),
              ],
            ),
            PageView(
              controller: _pvController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Opacity(
                  opacity: _page == MainView.homeView ? 1.0 : 0.0,
                  child: KeepAlivePage(
                    child: HomeView(
                      key: _homeState,
                    ),
                  ),
                ),
                Opacity(
                  opacity: _page == MainView.profileView ? 1.0 : 0.0,
                  child: KeepAlivePage(
                    child: ProfileView(
                      key: _profileState,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                AppWidget.bottomShadow(),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _pvIndicatorController,
                      count: 2,
                      effect: SlideEffect(
                        dotWidth: 120.w,
                        dotHeight: 3.h,
                        spacing: context.width / 3 - 60.w,
                        dotColor: AppColor.white,
                        activeDotColor: AppColor.mariner,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _navItem(
                          svgEnabled: "ic_home_active.svg",
                          svgDisabled: "ic_home.svg",
                          title: "Home",
                          page: MainView.homeView,
                          isSelected: _page == MainView.homeView,
                        ),
                        _navItem(
                          svgEnabled: "ic_profile_active.svg",
                          svgDisabled: "ic_profile.svg",
                          title: "Profile",
                          page: MainView.profileView,
                          isSelected: _page == MainView.profileView,
                        ),
                      ],
                    ),
                  ],
                )
                    .sizedBox(
                      height: 64.h,
                    )
                    .align(
                      alignment: Alignment.bottomCenter,
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required String svgEnabled,
    required String svgDisabled,
    required int page,
    required bool isSelected,
    required String title,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              AnimatedOpacity(
                opacity: isSelected ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 250),
                child: AppWidget.svg(
                  svg: svgDisabled,
                  color: AppColor.gunsmoke,
                  height: 20.r,
                ),
              ).align(),
              AnimatedOpacity(
                opacity: isSelected ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 250),
                child: AppWidget.svg(
                  svg: svgEnabled,
                  color: AppColor.mariner,
                  height: 20.r,
                ),
              ).align(),
            ],
          ).sizedBox(
            width: 26.r,
            height: 26.r,
          ),
          AppWidget.text(
            text: title,
            style: AppTextStyle.semiBoldCaption(
              color: isSelected ? AppColor.mariner : AppColor.gunsmoke,
            ),
          )
        ],
      ).rectangleRipple(
        height: 64.h,
        paddingAll: 0,
        rippleColor: AppColor.manatee,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        onPressed: () {
          _pvController.jumpToPage(page);
          _pvIndicatorController.animateToPage(
            page,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _pvController = PageController()
      ..addListener(() {
        var page = _pvController.page?.toInt() ?? 0;

        if (page == MainView.homeView) {
          setState(() {
            _page = MainView.homeView;
          });
        } else if (page == MainView.homeView) {
          setState(() {
            _page = MainView.homeView;
          });
        } else if (page == MainView.profileView) {
          setState(() {
            _page = MainView.profileView;
          });
        }
      });
  }
}
