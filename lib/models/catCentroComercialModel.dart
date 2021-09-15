//@dart=2.9
import 'dart:convert';

CatCentroComercialResponseModel catCentroComercialResponseModelFromJson(String str) => CatCentroComercialResponseModel.fromJson(json.decode(str));

String catCentroComercialResponseModelToJson(CatCentroComercialResponseModel data) => json.encode(data.toJson());

class CatCentroComercialResponseModel {
    CatCentroComercialResponseModel({
        this.msg,
        this.code,
        this.listado,
        this.error,
    });

    String msg;
    String code;
    List<Listado> listado;
    bool error;

    factory CatCentroComercialResponseModel.fromJson(Map<String, dynamic> json) => CatCentroComercialResponseModel(
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
        this.alertaVerde,
        this.alertaOcupacion,
        this.alertaRoja,
        this.ocupacionMaximaPersonas,
        this.ocupacionMaximaParqueos,
        this.id,
        this.value,
        this.alertaAmarilla,
    });

    String alertaVerde;
    String alertaOcupacion;
    String alertaRoja;
    String ocupacionMaximaPersonas;
    String ocupacionMaximaParqueos;
    String id;
    String value;
    String alertaAmarilla;

    factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        alertaVerde: json["alertaVerde"],
        alertaOcupacion: json["alertaOcupacion"],
        alertaRoja: json["alertaRoja"],
        ocupacionMaximaPersonas: json["ocupacionMaximaPersonas"],
        ocupacionMaximaParqueos: json["ocupacionMaximaParqueos"],
        id: json["id"],
        value: json["value"],
        alertaAmarilla: json["alertaAmarilla"],
    );

    Map<String, dynamic> toJson() => {
        "alertaVerde": alertaVerde,
        "alertaOcupacion": alertaOcupacion,
        "alertaRoja": alertaRoja,
        "ocupacionMaximaPersonas": ocupacionMaximaPersonas,
        "ocupacionMaximaParqueos": ocupacionMaximaParqueos,
        "id": id,
        "value": value,
        "alertaAmarilla": alertaAmarilla,
    };
}
