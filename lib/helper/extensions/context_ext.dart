import 'package:flutter/material.dart';
// import 'package:inspekta_dev/app/res/styles/app_bottom_sheet.dart';
// import 'package:inspekta_dev/data/domain/location.dart';
// import 'package:url_launcher/url_launcher.dart';

extension ContextExt on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  Map? arguments() {
    try {
      return ModalRoute.of(this)?.settings.arguments as Map;
    } catch (e) {
      return null;
    }
  }

  void clearFocus() {
    FocusScope.of(this).requestFocus(FocusNode());
  }

  // void launchMap(Location? location) async {
  //   var lat = location?.latitude;
  //   var lng = location?.longitude;
  //   var mapUrl = "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
  //   try {
  //     launchUrl(
  //       Uri.parse(mapUrl),
  //       mode: LaunchMode.externalApplication,
  //     );
  //   } catch(e) {
  //     try {
  //       mapUrl = "https://maps.apple.com/?q=$lat,$lng";
  //       launchUrl(
  //         Uri.parse(mapUrl),
  //         mode: LaunchMode.externalApplication,
  //       );
  //     } catch(e) {
  //       AppBottomSheet.showLocation(
  //           context: this,
  //           titleText: "Kesalahan",
  //           subTitleText: "Tidak ada aplikasi Maps di perangkat Anda."
  //       );
  //     }
  //   }
  // }

  push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  pushNamed({
    required String routeName,
    Object? arguments,
    Function(Map)? onReturnData,
    bool isCheckNull = true,
  }) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments).then((value) {
      if (onReturnData != null) {
        if (isCheckNull && value == null) return;
        onReturnData(value as Map);
      }
    });
  }

  pushAndRemoveFade(Widget page) {
    Navigator.pushAndRemoveUntil(
      this,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => page,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 250),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
