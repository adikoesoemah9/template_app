import 'package:base_app/helper/constants/constant.dart';

class AppConfig {
  static const development = {
    App.appName: 'Inspekta Dev',
    App.buildMode: Build.development,
    App.baseUrl: 'http://10.1.86.192:9213',
    App.baseKey: 'u/Gu5posvwDsXUnV5Zaq4g==',
    App.baseIV: '5D9r9ZVzEYYgha93/aUK2w==',
    App.plnSsoUrl: "https://crm.pln.co.id:8070",
    App.plnSsoAppSource: "PLN_CRM",
  };

  static const production = {
    App.appName: 'Inspekta',
    App.buildMode: Build.production,
    App.baseUrl: 'http://10.1.86.192:9213',
    App.baseKey: 'u/Gu5posvwDsXUnV5Zaq4g==',
    App.baseIV: '5D9r9ZVzEYYgha93/aUK2w==',
    App.plnSsoUrl: "https://crm.pln.co.id:8070",
    App.plnSsoAppSource: "PLN_CRM",
  };
}
