//@dart=2.9
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

UsersResponse usersResponseFromJson(String str) => UsersResponse.fromJson(json.decode(str));
String usersResponseToJson (UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
  UsersResponse({
    this.ok,
    this.users,
  });

  bool ok;
  List<User> users;

  factory UsersResponse.fromJson(Map<String,dynamic> json) => UsersResponse(
    ok: json["ok"],
    users: List<User>.from(json["users"].map((x)=> User.fromJson(x))),
  );

  Map<String,dynamic> toJson() => {
    "ok": ok,
    "users": List<dynamic>.from(users.map((x)=> x.toJson())),
  };
}

class User {
    User({
        this.lastName01,
        this.name02,
        this.lastName02,
        this.name01,
        this.rpas,
        this.nickname,
        this.photo,
        this.id,
        this.email,
    });

    String lastName01;
    String name02;
    String lastName02;
    String name01;
    String rpas;
    String nickname;
    String photo;
    String id;
    String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        lastName01: json["last_name01"],
        name02: json["name02"],
        lastName02: json["last_name02"],
        name01: json["name01"],
        rpas: json["rpas"],
        nickname: json["nickname"],
        photo: json["photo"],
        id: json["id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "last_name01": lastName01,
        "name02": name02,
        "last_name02": lastName02,
        "name01": name01,
        "rpas": rpas,
        "nickname": nickname,
        "photo": photo,
        "id": id,
        "email": email,
    };
}

