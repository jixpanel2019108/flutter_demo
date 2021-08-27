// To parse this JSON data, do
//
//     final forgotPassword = forgotPasswordFromJson(jsonString);

// @dart=2.9
import 'dart:convert';

ForgotPassword forgotPasswordFromJson(String str) => ForgotPassword.fromJson(json.decode(str));
String forgotPasswordToJson(ForgotPassword data) => json.encode(data.toJson());

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) => ForgotPasswordResponse.fromJson(json.decode(str));
String forgotPasswordResponseToJson(ForgotPasswordResponse data) => json.encode(data.toJson());

class ForgotPassword {
    ForgotPassword({
        this.key,
        this.user,
    });

    String key;
    String user;

    factory ForgotPassword.fromJson(Map<String, dynamic> json) => ForgotPassword(
        key: json["key"],
        user: json["user"],
    );

  Future <List<ForgotPassword>> get forgotPassword => null;

    Map<String, dynamic> toJson() => {
        "key": key,
        "user": user,
    };
}

class ForgotPasswordResponse{
  ForgotPasswordResponse({
    this.ok,
    this.forgotPassword,
    });

    bool ok;
    List<ForgotPassword> forgotPassword;

    factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => ForgotPasswordResponse(
      ok: json["ok"],
      forgotPassword: List<ForgotPassword>.from(json["forgotPassword"].map((x) => ForgotPassword.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "forgotPassword": List<dynamic>.from(forgotPassword.map((x) => x.toJson())),
    };

}