// @dart=2.9
import 'dart:convert';

class LoginUser {
  // ignore: non_constant_identifier_names
  String nombre_usuario;
  String clave;
  String key;

  // ignore: non_constant_identifier_names
  LoginUser({ this.nombre_usuario, this.clave, this.key});

  factory LoginUser.fromJson(Map<String, dynamic> json){
    return LoginUser(
      nombre_usuario: json["id"],
      clave: json["clave"],
      key: json["key"]
    );
  }
}

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.msg,
        this.code,
        this.id,
        this.error,
        this.token,
    });

    String msg;
    String code;
    String id;
    bool error;
    String token;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        msg: json["msg"],
        code: json["code"],
        id: json["id"],
        error: json["error"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "code": code,
        "id": id,
        "error": error,
        "token": token,
    };
}