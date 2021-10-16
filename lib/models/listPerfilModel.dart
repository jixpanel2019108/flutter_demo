// @dart=2.9
class ListPerfilResponseModel {
    
  final String msg;
  final String code;
  final bool error;
  final List perfil;

  ListPerfilResponseModel({this.msg, this.code, this.error, this.perfil});

  factory ListPerfilResponseModel.fromJson(Map<String, dynamic> json) {
    return ListPerfilResponseModel(
      msg: json["msg"] != null ? json["msg"] : "",
      code: json["code"] != null ? json["code"] : "",
      error: json["error"] != null ? json["error"] : "",
      perfil: json["perfil"] != null ? json["perfil"] : [],
    );
  }
}