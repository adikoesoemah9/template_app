import 'package:flutter/material.dart';
import 'package:base_app/app/values/app_color.dart';

class AppButtonStyle {
  static ButtonStyle primary({
    BorderRadiusGeometry? borderRadius,
    Color? backgroundColor,
    Color? rippleColor,
    BorderSide? side,
    InteractiveInkFeatureFactory? splashFactory,
    EdgeInsetsGeometry? padding,
    double? elevation,
  }) {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      backgroundColor: backgroundColor ?? AppColor.transparent,
      foregroundColor: rippleColor ?? AppColor.black,
      side: side,
      splashFactory: splashFactory,
      minimumSize: Size.zero,
      padding: padding ?? EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: elevation,
    );
  }
}
