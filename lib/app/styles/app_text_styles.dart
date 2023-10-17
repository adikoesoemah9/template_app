import 'package:flutter/material.dart';
import 'package:base_app/app/values/app_dimen.dart';

class AppTextStyle {
  static TextStyle openSans({
    required Color color,
    required double size,
    required FontWeight weight,
  }) {
    return TextStyle(
      fontFamily: "OpenSans",
      color: color,
      fontSize: size,
      fontWeight: weight,
    );
  }

  static regular({
    required Color color,
    required double size,
  }) {
    return openSans(
      color: color,
      size: size,
      weight: FontWeight.w400,
    );
  }

  static medium({
    required Color color,
    required double size,
  }) {
    return openSans(
      color: color,
      size: size,
      weight: FontWeight.w500,
    );
  }

  static semiBold({
    required Color color,
    required double size,
  }) {
    return openSans(
      color: color,
      size: size,
      weight: FontWeight.w600,
    );
  }

  static bold({
    required Color color,
    required double size,
  }) {
    return openSans(
      color: color,
      size: size,
      weight: FontWeight.w700,
    );
  }

  static regularBody1({
    required Color color,
  }) =>
      regular(color: color, size: AppDimen.body1);

  static regularBody2({
    required Color color,
  }) =>
      regular(color: color, size: AppDimen.body2);

  static regularCaption({
    required Color color,
  }) =>
      regular(color: color, size: AppDimen.caption);

  static regularOverline({
    required Color color,
  }) =>
      regular(color: color, size: AppDimen.overline);

  static mediumBody1({
    required Color color,
  }) =>
      medium(color: color, size: AppDimen.body1);

  static mediumBody2({
    required Color color,
  }) =>
      medium(color: color, size: AppDimen.body2);

  static mediumCaption({
    required Color color,
  }) =>
      medium(color: color, size: AppDimen.caption);

  static mediumOverline({
    required Color color,
  }) =>
      medium(color: color, size: AppDimen.overline);

  static semiBoldBody1({
    required Color color,
  }) =>
      semiBold(color: color, size: AppDimen.body1);

  static semiBoldBody2({
    required Color color,
  }) =>
      semiBold(color: color, size: AppDimen.body2);

  static semiBoldCaption({
    required Color color,
  }) =>
      semiBold(color: color, size: AppDimen.caption);

  static semiBoldOverline({
    required Color color,
  }) =>
      semiBold(color: color, size: AppDimen.overline);

  static boldHeadline5({
    required Color color,
  }) =>
      bold(color: color, size: AppDimen.headline5);

  static boldBody1({
    required Color color,
  }) =>
      bold(color: color, size: AppDimen.body1);

  static boldBody2({
    required Color color,
  }) =>
      bold(color: color, size: AppDimen.body2);

  static boldCaption({
    required Color color,
  }) =>
      bold(color: color, size: AppDimen.caption);
}
