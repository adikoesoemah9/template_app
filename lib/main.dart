import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:base_app/init_app.dart';
import 'package:base_app/helper/constants/constant.dart';
import 'package:base_app/app/values/app_color.dart';
import 'package:base_app/app/configs/app_config.dart';

Future main() async {
  FlavorConfig(
    name: Build.production,
    color: AppColor.blumine,
    location: BannerLocation.bottomStart,
    variables: AppConfig.production,
  );

  await preInitRunApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InitApp();
  }
}

Future<void> preInitRunApp() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  WidgetsFlutterBinding.ensureInitialized();
}
