// @dart=2.9
import 'dart:convert';

class LogoutResponse {
    
  final String msg;
  final String code;
  final bool error;

  LogoutResponse({this.msg, this.code, this.error});

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return LogoutResponse(
      msg: json["msg"] != null ? json["msg"] : "",
      code: json["code"] != null ? json["code"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}