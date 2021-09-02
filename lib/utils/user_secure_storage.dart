//@dart=2.9
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyUsername = "username";
  static const _keyLista = "lista";

  static Future setUsername(String username) async => await _storage.write(key: _keyUsername, value: username);
  static Future getUsername() async => await _storage.read(key: _keyUsername);

  static Future setLista(List<String> lista) async {
    final value = json.encode(lista);
    await _storage.write(key: _keyLista, value: value);
  }
  static Future<List<String>> getLista() async {
    final value = await _storage.read(key: _keyLista);
    return value == null ? null: List<String>.from(json.decode(value));
  }


}
