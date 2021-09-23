//@dart=2.9
// To parse this JSON data, do
//
//     final reportePersonasAnualResponseModel = reportePersonasAnualResponseModelFromJson(jsonString);

import 'dart:convert';

ReportePersonasAnualResponseModel reportePersonasAnualResponseModelFromJson(String str) => ReportePersonasAnualResponseModel.fromJson(json.decode(str));

String reportePersonasAnualResponseModelToJson(ReportePersonasAnualResponseModel data) => json.encode(data.toJson());

class ReportePersonasAnualResponseModel {
    ReportePersonasAnualResponseModel({
        this.msg,
        this.cc,
        this.code,
        this.listado,
        this.maximo,
        this.error,
        this.ultima,
    });

    String msg;
    String cc;
    String code;
    List<Listado> listado;
    String maximo;
    bool error;
    DateTime ultima;

    factory ReportePersonasAnualResponseModel.fromJson(Map<String, dynamic> json) => ReportePersonasAnualResponseModel(
        msg: json["msg"],
        cc: json["cc"],
        code: json["code"],
        listado: List<Listado>.from(json["listado"].map((x) => Listado.fromJson(x))),
        maximo: json["maximo"],
        error: json["error"],
        ultima: DateTime.parse(json["ultima"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "cc": cc,
        "code": code,
        "listado": List<dynamic>.from(listado.map((x) => x.toJson())),
        "maximo": maximo,
        "error": error,
        "ultima": "${ultima.year.toString().padLeft(4, '0')}-${ultima.month.toString().padLeft(2, '0')}-${ultima.day.toString().padLeft(2, '0')}",
    };
}

class Listado {
    Listado({
        this.fecha,
        this.conteo,
    });

    String fecha;
    String conteo;

    factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        fecha: json["fecha"],
        conteo: json["conteo"],
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "conteo": conteo,
    };
}
