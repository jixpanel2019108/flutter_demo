//@dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';

ReporteParqueosMesesCincoAnual reporteParqueosMesesCincoAnualFromJson(String str) => ReporteParqueosMesesCincoAnual.fromJson(json.decode(str));

String reporteParqueosMesesCincoAnualToJson(ReporteParqueosMesesCincoAnual data) => json.encode(data.toJson());

class ReporteParqueosMesesCincoAnual {
    ReporteParqueosMesesCincoAnual({
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

    factory ReporteParqueosMesesCincoAnual.fromJson(Map<String, dynamic> json) => ReporteParqueosMesesCincoAnual(
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
        this.color,
    });

    String entradas;
    String mes;
    String year;
    Color color;

    factory Listado.fromJson(Map<String, dynamic> json) => Listado(
        entradas: json["entradas"],
        mes: json["mes"],
        year: json["aÃ±o"],
    );

    Map<String, dynamic> toJson() => {
        "entradas": entradas,
        "mes": mes,
        "año": year,
        "color": color,
    };
}
