//@dart=2.9
// To parse this JSON data, do
//
//     final reportePersonaAnualMes = reportePersonaAnualMesFromJson(jsonString);

import 'dart:convert';

ReportePersonaAnualMes reportePersonaAnualMesFromJson(String str) => ReportePersonaAnualMes.fromJson(json.decode(str));

String reportePersonaAnualMesToJson(ReportePersonaAnualMes data) => json.encode(data.toJson());

class ReportePersonaAnualMes {
    ReportePersonaAnualMes({
        this.msg,
        this.total,
        this.code,
        this.listado,
        this.error,
    });

    String msg;
    String total;
    String code;
    List<Listado> listado;
    bool error;

    factory ReportePersonaAnualMes.fromJson(Map<String, dynamic> json) => ReportePersonaAnualMes(
        msg: json["msg"],
        total: json["total"],
        code: json["code"],
        listado: List<Listado>.from(json["listado"].map((x) => Listado.fromJson(x))),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "total": total,
        "code": code,
        "listado": List<dynamic>.from(listado.map((x) => x.toJson())),
        "error": error,
    };
}

class Listado {
    Listado({
        this.entradas,
        this.mes,
        this.year,
    });

    String entradas;
    String mes;
    String year;

    factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        entradas: json["entradas"],
        mes: json["Mes"],
        year: json["Año"],
    );

    Map<String, dynamic> toJson() => {
        "entradas": entradas,
        "Mes": mes,
        "Año": year,
    };
}
