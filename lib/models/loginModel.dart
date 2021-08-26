class LoginUser {
  String nombre_usuario;
  String clave;
  String key;

  LoginUser({required this.nombre_usuario,required this.clave,required this.key});

  factory LoginUser.fromJson(Map<String, dynamic> json){
    return LoginUser(
      nombre_usuario: json["id"],
      clave: json["clave"],
      key: json["key"]
    );
  }
}