//@dart=2.9
// To parse this JSON data, do
//
//     final reportePersonaDia = reportePersonaDiaFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

ReportePersonaDia reportePersonaDiaFromJson(String str) => ReportePersonaDia.fromJson(json.decode(str));

String reportePersonaDiaToJson(ReportePersonaDia data) => json.encode(data.toJson());

class ReportePersonaDia {
    ReportePersonaDia({
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

    factory ReportePersonaDia.fromJson(Map<String, dynamic> json) => ReportePersonaDia(
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
        this.color,
    });

    String fecha;
    String entradas;
    Color color;

    factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        fecha: json["fecha"],
        entradas: json["entradas"],
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "entradas": entradas,
        "color": color,
    };
}
