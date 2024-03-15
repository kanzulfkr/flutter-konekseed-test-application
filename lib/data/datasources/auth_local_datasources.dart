import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/response/auth_response_models.dart';

class AuthLocalDataSources {
  Future<bool> saveAuthData(AuthResponseModels model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = await pref.setString('auth', model.toJson());
    // final res = await pref.setString('auth', jsonEncode(model.toJson()));
    return res;
  }

  Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('auth') ?? '';
    final authData = AuthResponseModels.fromJson(jsonString);
    // final authData = AuthResponseModels.fromJson(jsonDecode(authJson));
    return authData.jwtToken;
  }

  Future<bool> removeToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = await pref.remove('auth');
    return res;
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }

  Future<AuthResponseModels> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('auth') ?? '';
    final authData = AuthResponseModels.fromJson(jsonString);
    return authData;
  }

  Future<int> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModels.fromJson(jsonDecode(authJson));
    return authData.data.id;
  }
}
