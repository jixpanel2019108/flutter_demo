//@dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';

ReporteParqueoDia reporteParqueoDiaFromJson(String str) => ReporteParqueoDia.fromJson(json.decode(str));

String reporteParqueoDiaToJson(ReporteParqueoDia data) => json.encode(data.toJson());

class ReporteParqueoDia {
    ReporteParqueoDia({
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

    factory ReporteParqueoDia.fromJson(Map<String, dynamic> json) => ReporteParqueoDia(
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
