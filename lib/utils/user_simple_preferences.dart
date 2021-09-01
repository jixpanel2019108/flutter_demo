// @dart=2.9
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences;

  //Username
  static const _keyUsername = "username";
  static const _keyToken = "token";
  static const _keyLast_name01 = "last_name01"; 
  static const _keyName02 = "name02"; 
  static const _keyLast_name02 = "last_name02"; 
  static const _keyName01 = "name01"; 
  static const _keyRpas = "rpas"; 
  static const _keyNickname = "nickname"; 
  static const _keyPhoto = "photo"; 
  static const _keyId = "id"; 
  static const _keyEmail = "email"; 




  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUserName(String username) async => await _preferences.setString(_keyUsername, username);
  static String getUsername() => _preferences.getString(_keyUsername);

  static Future setToken(String token) async => await _preferences.setString(_keyToken, token);
  static String getToken() => _preferences.getString(_keyToken);

  static Future setLast_name01(String last_name01) async => await _preferences.setString(_keyLast_name01, last_name01);
  static String getLast_name01() => _preferences.getString(_keyLast_name01);

  static Future setName02(String name02) async => await _preferences.setString(_keyName02, name02);
  static String getName02() => _preferences.getString(_keyName02);

  static Future setLast_name02(String last_name02) async => await _preferences.setString(_keyLast_name02, last_name02);
  static String getLast_name02() => _preferences.getString(_keyLast_name02);

  static Future setName01(String name01) async => await _preferences.setString(_keyName01, name01);
  static String getName01() => _preferences.getString(_keyName01);

  static Future setRpas(String rpas) async => await _preferences.setString(_keyRpas, rpas);
  static String getRpas() => _preferences.getString(_keyRpas);

  static Future setNickname(String nickname) async => await _preferences.setString(_keyNickname, nickname);
  static String getNickname() => _preferences.getString(_keyNickname);

  static Future setPhoto(String photo) async => await _preferences.setString(_keyPhoto, photo);
  static String getPhoto() => _preferences.getString(_keyPhoto);

  static Future setId(String id)async => await _preferences.setString(_keyId, id);
  static String getId() => _preferences.getString(_keyId);

  static Future setEmail(String email) async => await _preferences.setString(_keyEmail, email);
  static String getEmail() => _preferences.getString(_keyEmail);


}