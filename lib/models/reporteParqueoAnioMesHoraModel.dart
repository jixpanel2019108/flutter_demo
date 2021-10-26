//@dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';

ReporteParqueoAnioMesHora reporteParqueoAnioMesHoraFromJson(String str) => ReporteParqueoAnioMesHora.fromJson(json.decode(str));

String reporteParqueoAnioMesHoraToJson(ReporteParqueoAnioMesHora data) => json.encode(data.toJson());

class ReporteParqueoAnioMesHora {
    ReporteParqueoAnioMesHora({
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

    factory ReporteParqueoAnioMesHora.fromJson(Map<String, dynamic> json) => ReporteParqueoAnioMesHora(
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
        "color": color,
    };
}
