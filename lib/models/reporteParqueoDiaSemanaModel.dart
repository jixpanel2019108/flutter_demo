//@dart=2.9
// To parse this JSON data, do
//
//     final reporteParqueoDiaSemana = reporteParqueoDiaSemanaFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

ReporteParqueoDiaSemana reporteParqueoDiaSemanaFromJson(String str) => ReporteParqueoDiaSemana.fromJson(json.decode(str));

String reporteParqueoDiaSemanaToJson(ReporteParqueoDiaSemana data) => json.encode(data.toJson());

class ReporteParqueoDiaSemana {
    ReporteParqueoDiaSemana({
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

    factory ReporteParqueoDiaSemana.fromJson(Map<String, dynamic> json) => ReporteParqueoDiaSemana(
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
        this.color,
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
