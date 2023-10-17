import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base_app/app/styles/app_text_styles.dart';
import 'package:base_app/app/styles/app_widget.dart';
import 'package:base_app/app/values/app_color.dart';
import 'package:base_app/helper/constants/constant.dart';
import 'package:base_app/helper/extensions/widget_ext.dart';

class AppAppBar {
  static AppBar primary({
    required BuildContext context,
    Function()? onBackPressed,
    Function()? onItemClicked,
    Color? backgroundColor,
    Color? backPressedColor,
    Color? titleColor,
    String? backPressedSvg,
    String? titleText,
    double elevation = 0.0,
    bool isWhiteBgVisible = false,
    bool isTitleVisible = true,
    bool isTitleTextCenter = false,
    Widget? centerWidget,
    List<Widget> trailingWidgets = const [],
  }) {
    List<Widget> tWidgets = [];
    tWidgets.addAll(trailingWidgets);
    tWidgets.add(AppWidget.log(
      context: context,
      backPressedColor: backPressedColor,
      isWhiteBgVisible: isWhiteBgVisible,
    ));

    return AppBar(
      backgroundColor: backgroundColor ?? AppColor.white,
      elevation: elevation,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(
              children: [
                Visibility(
                  visible: onBackPressed != null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isWhiteBgVisible ? AppColor.white : null,
                      shape: BoxShape.circle,
                    ),
                    child: AppWidget.svg(
                      svg: backPressedSvg ?? "ic_arrow_back.svg",
                      width: 16.r,
                      color: backPressedColor ?? AppColor.textPrimary,
                    ).circleRipple(
                      size: 36.r,
                      onPressed: onBackPressed,
                    ),
                  ),
                ),
              ],
            ),
          ).padOnly(
            left: 10.w,
            right: 6.w,
          ),
          Expanded(
            child: AppWidget.animatedCrossFade(
              visible: isTitleVisible,
              replacement: centerWidget ?? Container(),
              child: AppWidget.text(
                text: titleText ?? AppString.empty,
                style: AppTextStyle.semiBoldBody1(
                  color: titleColor ?? AppColor.textPrimary,
                ),
                maxLines: 1,
                textAlign: isTitleTextCenter ? TextAlign.center : null,
              ),
            ),
          ),
          SizedBox(
            child: Row(
              children: tWidgets,
            ),
          ).padOnly(
            left: 6.w,
            right: 14.w,
          ),
        ],
      ),
    );
  }

  static AppBar hidden({Color? backgroundColor}) {
    return AppBar(
      toolbarHeight: 0,
      elevation: 0,
      backgroundColor: backgroundColor ?? AppColor.white,
    );
  }
}
