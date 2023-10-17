import 'dart:convert';
import 'dart:math';

import 'package:encrypt/encrypt.dart' as e;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:geolocator/geolocator.dart';
import 'package:base_app/helper/constants/constant.dart';

class AppUtil {
  static int dateNow() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static double topPadding(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top;
  }

  static String image(String? name) {
    return "assets/images/$name";
  }

  static String svg(String? name) {
    return "assets/svg/$name";
  }

  static bool isIos() {
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  static bool isDevMode() {
    if (FlavorConfig.instance.variables[App.buildMode] == Build.development) {
      return true;
    }
    return false;
  }

  static bool isProdMode() {
    if (FlavorConfig.instance.variables[App.buildMode] == Build.production) {
      return true;
    }
    return false;
  }

  static Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<bool> isLocationPermissionEnabled() async {
    return (await Geolocator.checkPermission()) != LocationPermission.denied;
  }

  static String flavorValue(String name) {
    return FlavorConfig.instance.variables[name];
  }

  static int jobCode() {
    return Random().nextInt(999999999);
  }

  static String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  static DateTime updateDate({
    required DateTime date,
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? date.year,
      month ?? date.month,
      day ?? date.day,
      hour ?? date.hour,
      minute ?? date.minute,
      second ?? date.second,
      millisecond ?? date.millisecond,
      microsecond ?? date.microsecond,
    );
  }

  static dynamic encryptJson(dynamic data) {
    final key = e.Key.fromBase64(AppUtil.flavorValue(App.baseKey));
    final iv = e.IV.fromBase64(AppUtil.flavorValue(App.baseIV));
    final encrypter = e.Encrypter(e.AES(key, mode: e.AESMode.cbc));
    return encrypter.encrypt(jsonEncode(data), iv: iv).base64;
  }

  static dynamic decryptJson(dynamic source) {
    final key = e.Key.fromBase64(AppUtil.flavorValue(App.baseKey));
    final iv = e.IV.fromBase64(AppUtil.flavorValue(App.baseIV));
    final encrypter = e.Encrypter(e.AES(key, mode: e.AESMode.cbc));
    final decrypted = encrypter.decrypt(e.Encrypted.fromBase64(source), iv: iv);
    return jsonDecode(decrypted);
  }
}
