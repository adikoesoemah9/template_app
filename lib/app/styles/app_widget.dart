import 'dart:io';

import 'package:dio_log/http_log_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base_app/app/styles/app_text_styles.dart';
import 'package:base_app/app/values/app_color.dart';
import 'package:base_app/app/services/service_status.dart';
import 'package:base_app/helper/constants/constant.dart';
import 'package:base_app/helper/extensions/context_ext.dart';
import 'package:base_app/helper/extensions/string_ext.dart';
import 'package:base_app/helper/extensions/widget_ext.dart';
import 'package:base_app/helper/utils/app_util.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWidget {
  static Widget margin({
    double width = 0.0,
    double height = 0.0,
  }) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  static Widget divider({
    double? height,
    double? width,
  }) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 1.h,
      color: AppColor.mystic,
    );
  }

  static Widget circle({
    double? size,
    Color? color,
  }) {
    return Container(
      width: size ?? 16.r,
      height: size ?? 16.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? AppColor.manatee,
      ),
    );
  }

  static Widget text({
    required String text,
    TextAlign? textAlign,
    TextStyle? style,
    int? maxLines,
    bool isJustify = true,
  }) {
    return Text(
      isJustify ? text.replaceAll('', '\u200B') : text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget emptyText({
    double? size,
  }) {
    return Text(
      AppString.empty,
      style: AppTextStyle.regular(color: AppColor.transparent, size: size ?? 0),
    );
  }

  static Widget image({
    String image = AppString.empty,
    double? width,
    double? height,
  }) {
    if (image.isEmpty) return Container();
    return Image.asset(
      AppUtil.image(image),
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }

  static Widget svg({
    String svg = AppString.empty,
    double? width,
    double? height,
    Color? color,
  }) {
    if (svg.isEmpty) return Container();
    return SvgPicture.asset(
      AppUtil.svg(svg),
      width: width,
      height: height,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
    );
  }

  static Widget imageSource({
    String? path,
    BoxFit? fit,
  }) {
    if (path == null || path.isEmpty) return Container();

    if (path.isValidUrl()) {
      return FadeInImage.assetNetwork(
        placeholder: AppUtil.image("img_placeholder.png"),
        image: path,
        fit: fit ?? BoxFit.cover,
        imageErrorBuilder: (_, __, ___) {
          return Container(
            color: AppColor.bonJour,
          );
        },
      );
    } else {
      return Image.file(
        File(path),
        fit: fit ?? BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return Container(
            color: AppColor.bonJour,
          );
        },
      );
    }
  }

  static Widget animatedCrossFade({
    required bool visible,
    required Widget child,
    Widget replacement = const SizedBox.shrink(),
    Duration duration = const Duration(milliseconds: 250),
    Curve? firstCurve,
    Curve? secondCurve,
  }) {
    return AnimatedCrossFade(
      duration: duration,
      firstChild: child,
      secondChild: replacement,
      firstCurve: firstCurve ?? Curves.easeOutBack,
      secondCurve: secondCurve ?? Curves.easeInBack,
      crossFadeState:
          visible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  static Widget shimmerFont({
    double? width = 0.0,
    double? fontSize,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          AppString.empty,
          style: TextStyle(
            fontFamily: "OpenSans",
            fontSize: fontSize,
          ),
        ),
        Container(
          width: width,
          height: fontSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColor.manatee,
          ),
        ),
      ],
    );
  }

  static Widget check({
    bool isSelected = false,
  }) {
    return Visibility(
      visible: isSelected,
      replacement: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            4.r,
          ),
          border: Border.all(
            color: AppColor.bonJour,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.tertiary,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: svg(
          svg: "ic_check.svg",
          color: AppColor.white,
          width: 12.r,
        ).align(),
      ),
    ).sizedBox(
      width: 20.r,
      height: 20.r,
    );
  }

  static Widget loading({
    Color backgroundColor = AppColor.white,
    Color indicatorColor = AppColor.primary,
    ServiceStatus? status,
  }) {
    var isVisible = status.isLoading();
    return IgnorePointer(
      ignoring: !isVisible,
      child: AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        child: Container(
          color: backgroundColor,
          child: AnimatedOpacity(
            opacity: isVisible ? 1.0 : 0.0,
            curve: Curves.decelerate,
            duration: const Duration(milliseconds: 250),
            child: CircularProgressIndicator(
              color: indicatorColor,
              strokeWidth: 3.w,
            ),
          ).align(),
        ),
      ),
    );
  }

  static Widget bottomShadow() {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        height: 180.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.black.withOpacity(0.2),
              AppColor.white.withOpacity(0.0001)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ).align(
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  static Widget sideShadow({
    double? width,
    BorderRadiusGeometry? borderRadius,
    leftSide = true,
  }) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        width: width ?? 120.w,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
          gradient: LinearGradient(
            colors: [AppColor.white, AppColor.white.withOpacity(0.0001)],
            begin: leftSide ? Alignment.centerLeft : Alignment.centerRight,
            end: leftSide ? Alignment.centerRight : Alignment.centerLeft,
          ),
        ),
      ),
    );
  }

  static Widget emptyNotice({
    bool visible = false,
    String text = AppString.empty,
    String desc = AppString.empty,
    Color backgroundColor = AppColor.white,
    double padHorizontal = 0.0,
    double? height,
  }) {
    return Visibility(
      visible: visible,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                color: backgroundColor,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppWidget.margin(height: 16.h),
                    AppWidget.svg(
                      svg: "vis_empty_data.svg",
                      width: 200.w,
                    ).align(),
                    AppWidget.margin(height: 24.h),
                    Text(
                      text,
                      style: AppTextStyle.boldBody1(
                        color: AppColor.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    AppWidget.margin(height: 16.h),
                    Text(
                      desc,
                      style: AppTextStyle.regularCaption(
                        color: AppColor.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ).padSymmetric(horizontal: 24.w),
                    AppWidget.margin(height: 40.h),
                  ],
                ).padSymmetric(horizontal: padHorizontal),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget emptyNoticeSimple({
    String text = "Tidak ada hasil",
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColor.bonJour,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppWidget.svg(
            svg: "vis_empty_data.svg",
            width: 100.w,
          ),
          AppWidget.margin(
            width: 12.w,
          ),
          Text(
            text,
            style: AppTextStyle.semiBoldBody2(
              color: AppColor.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ).padSymmetric(
        vertical: 12.h,
      ),
    );
  }

  static Widget webView({
    required WebViewController controller,
    bool isVisible = false,
  }) {
    return Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        IgnorePointer(
          ignoring: true,
          child: Visibility(
            visible: !isVisible,
            child: Container(
              color: AppColor.gallery,
            ),
          ),
        ),
      ],
    );
  }

  static Widget datePicker({
    required DateRangePickerController controller,
    required Function(DateTime date) onDateChanged,
    DateTime? initialSelectedDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) {
    return SfDateRangePicker(
      controller: controller,
      initialSelectedDate: initialSelectedDate,
      initialDisplayDate: initialSelectedDate,
      minDate: minDate,
      maxDate: maxDate,
      selectionColor: AppColor.tertiary,
      todayHighlightColor: AppColor.tertiary,
      toggleDaySelection: true,
      showNavigationArrow: true,
      selectionTextStyle: AppTextStyle.mediumCaption(
        color: AppColor.white,
      ),
      headerStyle: DateRangePickerHeaderStyle(
        textStyle: AppTextStyle.semiBoldBody2(
          color: AppColor.tertiary,
        ),
      ),
      monthCellStyle: DateRangePickerMonthCellStyle(
        textStyle: AppTextStyle.mediumCaption(
          color: AppColor.textPrimary,
        ),
        todayTextStyle: AppTextStyle.mediumCaption(
          color: AppColor.tertiary,
        ),
      ),
      yearCellStyle: DateRangePickerYearCellStyle(
        textStyle: AppTextStyle.mediumCaption(
          color: AppColor.textPrimary,
        ),
        todayTextStyle: AppTextStyle.mediumCaption(
          color: AppColor.tertiary,
        ),
      ),
      monthViewSettings: DateRangePickerMonthViewSettings(
        viewHeaderStyle: DateRangePickerViewHeaderStyle(
          textStyle: AppTextStyle.semiBoldCaption(
            color: AppColor.textPrimary,
          ),
        ),
        weekNumberStyle: DateRangePickerWeekNumberStyle(
          textStyle: AppTextStyle.mediumCaption(
            color: AppColor.textPrimary,
          ),
        ),
      ),
      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
        if (args.value is DateTime) {
          onDateChanged(args.value);
        }
      },
    );
  }

  static Widget log({
    required BuildContext context,
    Color? backPressedColor,
    bool isWhiteBgVisible = false,
  }) {
    return Visibility(
      visible: AppUtil.isDevMode(),
      child: Container(
        decoration: BoxDecoration(
          color: isWhiteBgVisible ? AppColor.white : null,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.bug_report,
          color: backPressedColor ?? AppColor.textPrimary,
          size: 24.r,
        ).circleRipple(
          size: 36.r,
          onPressed: () {
            context.push(HttpLogListWidget());
          },
        ),
      ),
    );
  }
}
