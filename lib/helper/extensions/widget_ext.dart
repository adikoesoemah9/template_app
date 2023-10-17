import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base_app/app/styles/app_button_style.dart';
import 'package:shimmer/shimmer.dart';

extension WidgetExt on Widget {
  Widget align({
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget defaultShimmer({
    bool isEnabled = true,
    Color? baseColor,
    Color? highlightColor,
  }) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      enabled: isEnabled,
      child: this,
    );
  }

  Widget padOnly(
      {double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0}) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }

  Widget padSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget sizedBox({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget circleRipple({
    double size = 0.0,
    Function()? onPressed,
    bool isLoading = false,
  }) {
    return TextButton(
      onPressed: !isLoading ? onPressed : null,
      style: AppButtonStyle.primary(
        borderRadius: BorderRadius.circular(size / 2),
        splashFactory:
            !isLoading ? InkSplash.splashFactory : NoSplash.splashFactory,
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: this,
        ),
      ),
    );
  }

  Widget circleRippleClicked({
    double size = 0.0,
    Function()? onItemClicked,
    bool isLoading = false,
  }) {
    return TextButton(
      onPressed: !isLoading ? onItemClicked : null,
      style: AppButtonStyle.primary(
        borderRadius: BorderRadius.circular(size / 2),
        splashFactory:
            !isLoading ? InkSplash.splashFactory : NoSplash.splashFactory,
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: this,
        ),
      ),
    );
  }

  Widget rectangleRipple({
    double? paddingAll,
    double? circularRadius,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    Function()? onPressed,
    Function()? onLongPress,
    bool isLoading = false,
    bool isCentered = true,
    Color? backgroundColor,
    Color? rippleColor,
  }) {
    return TextButton(
      onPressed: !isLoading ? onPressed : null,
      onLongPress: !isLoading ? onLongPress : null,
      style: AppButtonStyle.primary(
        borderRadius:
            borderRadius ?? BorderRadius.circular(circularRadius ?? 8.r),
        splashFactory:
            !isLoading ? InkSplash.splashFactory : NoSplash.splashFactory,
        padding: padding ?? EdgeInsets.all(paddingAll ?? 4.r),
        rippleColor: rippleColor,
        backgroundColor: backgroundColor,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Visibility(
          visible: isCentered,
          replacement: this,
          child: Center(
            child: this,
          ),
        ),
      ),
    );
  }
}
