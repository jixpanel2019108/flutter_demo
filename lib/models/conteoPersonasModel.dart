//@dart=2.9
import 'dart:convert';

ConteoPersonasResponseModel conteoPersonasResponseModelFromJson(String str) => ConteoPersonasResponseModel.fromJson(json.decode(str));

String conteoPersonasResponseModelToJson(ConteoPersonasResponseModel data) => json.encode(data.toJson());

class ConteoPersonasResponseModel {
    ConteoPersonasResponseModel({
        this.msg,
        this.code,
        this.totalD,
        this.listado1,
        this.total1,
        this.total2,
        this.total3,
        this.error,
        this.listadoD,
        this.listado2,
        this.listado3,
    });

    String msg;
    String code;
    String totalD;
    List<Listado1> listado1;
    String total1;
    String total2;
    String total3;
    bool error;
    List<dynamic> listadoD;
    List<dynamic> listado2;
    List<dynamic> listado3;

    factory ConteoPersonasResponseModel.fromJson(Map<String, dynamic> json) => ConteoPersonasResponseModel(
        msg: json["msg"],
        code: json["code"],
        totalD: json["totalD"],
        listado1: List<Listado1>.from(json["listado1"].map((x) => Listado1.fromJson(x))),
        total1: json["total1"],
        total2: json["total2"],
        total3: json["total3"],
        error: json["error"],
        listadoD: List<dynamic>.from(json["listadoD"].map((x) => x)),
        listado2: List<dynamic>.from(json["listado2"].map((x) => x)),
        listado3: List<dynamic>.from(json["listado3"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "code": code,
        "totalD": totalD,
        "listado1": List<dynamic>.from(listado1.map((x) => x.toJson())),
        "total1": total1,
        "total2": total2,
        "total3": total3,
        "error": error,
        "listadoD": List<dynamic>.from(listadoD.map((x) => x)),
        "listado2": List<dynamic>.from(listado2.map((x) => x)),
        "listado3": List<dynamic>.from(listado3.map((x) => x)),
    };
}

class Listado1 {
    Listado1({
        this.cc,
        this.fecha,
        this.acumuladoSalidas,
        this.alertaOcupacion,
        this.ocupacionInstantanea,
        this.hora,
        this.entradas,
        this.ocupacionMaximaAutorizada,
        this.porcentajeOcupacion,
        this.salidas,
        this.acumuladoEntradas,
    });

    Cc cc;
    DateTime fecha;
    String acumuladoSalidas;
    String alertaOcupacion;
    String ocupacionInstantanea;
    String hora;
    String entradas;
    String ocupacionMaximaAutorizada;
    String porcentajeOcupacion;
    String salidas;
    String acumuladoEntradas;

    factory Listado1.fromJson(Map<String, dynamic> json) => Listado1(
        cc: ccValues.map[json["cc"]],
        fecha: DateTime.parse(json["fecha"]),
        acumuladoSalidas: json["acumuladoSalidas"],
        alertaOcupacion: json["alertaOcupacion"],
        ocupacionInstantanea: json["ocupacionInstantanea"],
        hora: json["hora"],
        entradas: json["entradas"],
        ocupacionMaximaAutorizada: json["OcupacionMaximaAutorizada"],
        porcentajeOcupacion: json["porcentajeOcupacion"],
        salidas: json["salidas"],
        acumuladoEntradas: json["acumuladoEntradas"],
    );

    Map<String, dynamic> toJson() => {
        "cc": ccValues.reverse[cc],
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "acumuladoSalidas": acumuladoSalidas,
        "alertaOcupacion": alertaOcupacion,
        "ocupacionInstantanea": ocupacionInstantanea,
        "hora": hora,
        "entradas": entradas,
        "OcupacionMaximaAutorizada": ocupacionMaximaAutorizada,
        "porcentajeOcupacion": porcentajeOcupacion,
        "salidas": salidas,
        "acumuladoEntradas": acumuladoEntradas,
    };
}

enum Cc { MIRAFLORES }

final ccValues = EnumValues({
    "MIRAFLORES": Cc.MIRAFLORES
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
