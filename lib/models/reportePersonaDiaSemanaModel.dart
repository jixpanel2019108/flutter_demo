//@dart=2.9
// To parse this JSON data, do
//
//     final reportePersonaDiaSemana = reportePersonaDiaSemanaFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

ReportePersonaDiaSemana reportePersonaDiaSemanaFromJson(String str) => ReportePersonaDiaSemana.fromJson(json.decode(str));

String reportePersonaDiaSemanaToJson(ReportePersonaDiaSemana data) => json.encode(data.toJson());

class ReportePersonaDiaSemana {
    ReportePersonaDiaSemana({
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

    factory ReportePersonaDiaSemana.fromJson(Map<String, dynamic> json) => ReportePersonaDiaSemana(
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
        this.numero,
        this.entradas,
        this.dia,
        this.color
    });

    String numero;
    String entradas;
    String dia;
    Color color;

    factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        numero: json["numero"],
        entradas: json["entradas"],
        dia: json["dia"],
    );

    Map<String, dynamic> toJson() => {
        "numero": numero,
        "entradas": entradas,
        "dia": dia,
        "color": color,
    };
}
