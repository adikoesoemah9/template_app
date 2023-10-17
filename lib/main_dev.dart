import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:base_app/app/values/app_color.dart';
import 'package:base_app/app/configs/app_config.dart';
import 'package:base_app/helper/constants/constant.dart';
import 'package:base_app/init_app.dart';
import 'package:base_app/main.dart';

Future main() async {
  FlavorConfig(
    name: Build.development,
    color: AppColor.blumine,
    location: BannerLocation.bottomStart,
    variables: AppConfig.development,
  );

  await preInitRunApp();

  runApp(const MainAppDev());
}

class MainAppDev extends StatelessWidget {
  const MainAppDev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FlavorBanner(
      child: InitApp(),
    );
  }
}
