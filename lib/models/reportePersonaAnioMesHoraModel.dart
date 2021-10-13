// @dart=2.9
// To parse this JSON data, do
//
//     final reportePersonaAnioMesHora = reportePersonaAnioMesHoraFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

ReportePersonaAnioMesHora reportePersonaAnioMesHoraFromJson(String str) => ReportePersonaAnioMesHora.fromJson(json.decode(str));

String reportePersonaAnioMesHoraToJson(ReportePersonaAnioMesHora data) => json.encode(data.toJson());

class ReportePersonaAnioMesHora {
    ReportePersonaAnioMesHora({
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

    factory ReportePersonaAnioMesHora.fromJson(Map<String, dynamic> json) => ReportePersonaAnioMesHora(
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
        this.fecha,
        this.entradas,
        this.mes,
        this.year,
        this.color,
    });

    String fecha;
    String entradas;
    String mes;
    String year;
    Color color;

    factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        fecha: json["fecha"],
        entradas: json["entradas"],
        mes: json["mes"],
        year: json["aÃ±o"],
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "entradas": entradas,
        "mes": mes,
        "año": year,
    };
}
