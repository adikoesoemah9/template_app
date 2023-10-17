import 'package:base_app/helper/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BasePreferences {
  //In check
  Future<SharedPreferences> _instance() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> getString(String key) async {
    return (await _instance()).getString(key) ?? AppString.empty;
  }

  Future<void> setString(String key, String value) async {
    (await _instance()).setString(key, value);
  }

  Future<int> getInt(String key) async {
    return (await _instance()).getInt(key) ?? 0;
  }

  Future<void> setInt(String key, int value) async {
    (await _instance()).setInt(key, value);
  }

  Future<double> getDouble(String key) async {
    return (await _instance()).getDouble(key) ?? 0.0;
  }

  Future<void> setDouble(String key, double value) async {
    (await _instance()).setDouble(key, value);
  }

  Future<bool> getBool(String key) async {
    return (await _instance()).getBool(key) ?? false;
  }

  Future<void> setBool(String key, bool value) async {
    (await _instance()).setBool(key, value);
  }

  Future<void> remove(String key) async {
    (await _instance()).remove(key);
  }
}
