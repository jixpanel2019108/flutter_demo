//@dart=2.9
import 'dart:convert';

CatRazonSocialResponseModel catRazonSocialResponseModelFromJson(String str) => CatRazonSocialResponseModel.fromJson(json.decode(str));

String catRazonSocialResponseModelToJson(CatRazonSocialResponseModel data) => json.encode(data.toJson());

class CatRazonSocialResponseModel {
    CatRazonSocialResponseModel({
        this.msg,
        this.code,
        this.listado,
        this.error,
    });

    String msg;
    String code;
    List<Listado> listado;
    bool error;

    factory CatRazonSocialResponseModel.fromJson(Map<String, dynamic> json) => CatRazonSocialResponseModel(
        msg: json["msg"],
        code: json["code"],
        listado: List<Listado>.from(json["listado"].map((x) => Listado.fromJson(x))),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "code": code,
        "listado": List<dynamic>.from(listado.map((x) => x.toJson())),
        "error": error,
    };
}

class Listado {
    Listado({
        this.id,
        this.value,
    });

    String id;
    String value;

    factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
    };
}