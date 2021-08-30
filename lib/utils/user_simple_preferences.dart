// @dart=2.9
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences;

  //Username
  static const _keyUsername = "username";
  static const _keyToken = "token";

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUserName(String username) async => await _preferences.setString(_keyUsername, username);
  static String getUsername() => _preferences.getString(_keyUsername);

  static Future setToken(String token) async => await _preferences.setString(_keyToken, token);
  static String getToken() => _preferences.getString(_keyToken);

}