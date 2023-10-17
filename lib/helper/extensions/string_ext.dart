import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:base_app/helper/constants/constant.dart';
import 'package:base_app/helper/utils/app_util.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;

extension StringExt on String {
  bool iLike(String? value) {
    return toLowerCase().contains(value?.toLowerCase() ?? AppString.empty);
  }

  bool get isNotDash => this != AppString.dash;

  bool isImage() {
    var ext = p.extension(this);
    return ext == ".jpeg" || ext == ".jpg" || ext == ".png";
  }

  bool asBool() {
    if (isEmpty || this == "0") return false;
    return true;
  }

  String? get nullIfEmpty => isEmpty ? null : this;

  String get imagePath => "${AppUtil.flavorValue(App.baseUrl)}/$this";

  String? emptyValidator() {
    if (isEmpty) return "Tidak boleh kosong";
    return null;
  }

  String andQuery(String query) {
    return this + (isEmpty ? AppString.empty : " and ") + query;
  }

  String orQuery(String query) {
    return this + (isEmpty ? AppString.empty : " or ") + query;
  }

  int getMilliseconds(String format) {
    try {
      final DateTime d = DateFormat(format, 'en').parse(this);
      return d.millisecondsSinceEpoch;
    } catch (e) {
      debugPrint("$e");
      return 0;
    }
  }

  String getUrlQuery(String query) {
    if (isValidUrl()) {
      var uri = Uri.parse(this);
      return uri.queryParameters[query] ?? AppString.empty;
    } else {
      return AppString.empty;
    }
  }

  String getPermitNumber() {
    if (isEmpty || !isNotDash || length < 15) return AppString.dash;

    var year = "20${substring(0, 2)}";
    var monthInRomans = substring(2, 4).getMonthInRomans();
    var unit = substring(4, 8);
    var index = substring(12, 15);

    return "$index/$unit/$monthInRomans/$year";
  }

  String getMonthInRomans() {
    if (this == "01") return "I";
    if (this == "02") return "II";
    if (this == "03") return "III";
    if (this == "04") return "IV";
    if (this == "05") return "V";
    if (this == "06") return "VI";
    if (this == "07") return "VII";
    if (this == "08") return "VIII";
    if (this == "09") return "IX";
    if (this == "10") return "X";
    if (this == "11") return "XI";
    if (this == "12") return "XII";
    return AppString.empty;
  }

  bool isValidUrl() {
    return Uri.parse(this).isAbsolute;
  }

  Future<MultipartFile> asMultipartFile() async {
    var file = File(this);
    final fileBytes = await file.readAsBytes();
    final multipartFile = MultipartFile.fromBytes(
      fileBytes,
      filename: file.path.split('/').last,
      contentType: MediaType('application', 'octet-stream'),
    );
    return multipartFile;
  }
}
