// @dart=2.9
import 'dart:convert';

class ListMenuResponseModel {
    
  final String msg;
  final String code;
  final bool error;
  final List menu;

  ListMenuResponseModel({this.msg, this.code, this.error, this.menu});

  factory ListMenuResponseModel.fromJson(Map<String, dynamic> json) {
    return ListMenuResponseModel(
      msg: json["msg"] != null ? json["msg"] : "",
      code: json["code"] != null ? json["code"] : "",
      error: json["error"] != null ? json["error"] : "",
      menu: json["menu"] != null ? json["menu"] : [],
    );
  }
}