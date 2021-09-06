
// @dart=2.9
import 'dart:convert';

class forgotPasswordResponse {
    
  final String msg;
  final String code;
  final bool error;

  forgotPasswordResponse({this.msg, this.code, this.error});

  factory forgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return forgotPasswordResponse(
      msg: json["msg"] != null ? json["msg"] : "",
      code: json["code"] != null ? json["code"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}