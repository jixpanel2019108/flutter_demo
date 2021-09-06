// @dart=2.9
import 'dart:convert';

class LoginResponseModel {
    
  final String msg;
  final String code;
  final String id;
  final String token;
  final bool error;

  LoginResponseModel({this.msg, this.code, this.id, this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      msg: json["msg"] != null ? json["msg"] : "",
      code: json["code"] != null ? json["code"] : "",
      id: json["id"] != null ? json["id"] : "",
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}