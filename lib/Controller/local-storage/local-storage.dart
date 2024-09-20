import 'dart:convert';
import 'package:firstforapp/Model/credential.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController {
  static SharedPreferences? _sp;

  LocalStorage._();

  static Future<LocalStorage> initialize() async {
    _sp = await SharedPreferences.getInstance();
    return LocalStorage._();
  }

  Future<void> saveUser({required String key, required String value}) async =>
      await _sp!.setString(key, value);

  Credential? getCurrentUser({required String key}) {
    String? strCredential = _sp!.getString(key);
    if (strCredential != null) {
      Map json = jsonDecode(strCredential);
      return Credential.fromJson(json);
    }
    return null;
  }

  void clear() {
    _sp!.clear();
  }
}
