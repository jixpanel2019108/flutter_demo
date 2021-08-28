class LoginUser {
  // ignore: non_constant_identifier_names
  String nombre_usuario;
  String clave;
  String key;

  // ignore: non_constant_identifier_names
  LoginUser({required this.nombre_usuario,required this.clave,required this.key});

  factory LoginUser.fromJson(Map<String, dynamic> json){
    return LoginUser(
      nombre_usuario: json["id"],
      clave: json["clave"],
      key: json["key"]
    );
  }
}

