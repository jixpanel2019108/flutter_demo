//@dart=2.9

import 'dart:async';
import 'dart:convert';
import 'package:flutter_demo/models/reporteParqueoAnioMesHoraModel.dart';
import 'package:flutter_demo/models/reporteParqueoAnualMesModel.dart';
import 'package:flutter_demo/models/reporteParqueoDiaModel.dart';
import 'package:flutter_demo/models/reporteParqueoDiaSemanaModel.dart';
import 'package:flutter_demo/models/reporteParqueosAnualModel.dart';
import 'package:flutter_demo/models/reporteParqueosMesesCincoAnualModel.dart';
import 'package:http/http.dart' as http;

class ReportService{

  String urlReporte = "https://demo.s3.gt/cargainventarios/ws/post";

  Future <ReporteParqueosAnual> reporteParqueosAnual (String token, String inmueble, String fini, String ffin) async {

    var urlRequest = Uri.parse(urlReporte+"/reporteParqueosAnual");
    var bodyRequest = jsonEncode({
                                  "key": "12345",
                                  "token": token,
                                  "inmueble": inmueble,
                                  "excel": "0",
                                  "fini": fini,
                                  "ffin": ffin
                                });
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ReporteParqueosAnual.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in conteoParqueos Service');
    }
  }

  Future <ReporteParqueoDia> reporteParqueoDia (String token, String inmueble, String mes, String year) async{
    print(inmueble);
    print(mes);
    print(year);
    var urlRequest = Uri.parse(urlReporte+"/reporteParqueoDia");
    var bodyRequest = jsonEncode({"key": "12345", 
                                  "token": token, 
                                  "inmueble": inmueble,
                                  "mes": mes,
                                  "año": year});
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ReporteParqueoDia.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in ReporteParqueoDia Service');
    }

  }

  Future <ReporteParqueoAnualMes> reporteParqueoAnualMes (String token,String usuario, String inmueble, String aini, String afin, String mes) async{

    print(inmueble);
    print(aini);
    print(afin);
    print(mes);
    

    var urlRequest = Uri.parse(urlReporte+"/reporteParqueoAnualMes");
    var bodyRequest = jsonEncode({"key": "12345", 
                                  "token": token, 
                                  "inmueble": inmueble,
                                  "aini": aini,
                                  "afin": afin,
                                  "mes":mes,
                                  "usuario": usuario,
                                  "excel": "0"});
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ReporteParqueoAnualMes.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in ReporteParqueoAnualMes Service');
    }
  }

  Future <ReporteParqueosMesesCincoAnual> reporteParqueosMesesCincoAnual (String token,String usuario, String inmueble, String aini, String afin) async{

    var urlRequest = Uri.parse(urlReporte+"/reporteParqueosMesesCincoAnual");
    var bodyRequest = jsonEncode({
                                    "key": "12345",
                                    "token": token,
                                    "inmueble": inmueble,
                                    "aini": aini,
                                    "afin": afin,
                                    "excel":"0"
                                  });
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ReporteParqueosMesesCincoAnual.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in ReporteParqueosMesesCincoAnual Service');
    }
  }
  
  Future <ReporteParqueoAnioMesHora> reporteParqueoAnioMesHora (String token,String usuario, String inmueble, String aIni, String aFin, 
                                                        String mesIni, String mesFin, String diaIni, String diaFin, String horaIni, String horaFin) async{

    var urlRequest = Uri.parse(urlReporte+"/reporteParqueoAnioMesHora");
    var bodyRequest = jsonEncode({
                                  "key": "12345",
                                  "token": token,
                                  "inmueble": inmueble,
                                  "añoIni": aIni,
                                  "añoFin": aFin,
                                  "mesIni": mesIni,
                                  "mesFin": mesFin,
                                  "diaIni": diaIni,
                                  "diaFin": diaFin,
                                  "horaIni": diaIni,
                                  "horaFin": horaFin,
                                  "excel":"0"
                                });
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ReporteParqueoAnioMesHora.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in reporteParqueoAnioMesHora Service');
    }
  }
  
  Future <ReporteParqueoDiaSemana> reporteParqueoDiaSemana (String token,String usuario, String inmueble, String year, 
                                                        String mes, String diaIni, String diaFin) async{
      print(year);
      print(mes);
      print(diaIni);
      print(diaFin);
    var urlRequest = Uri.parse(urlReporte+"/reporteParqueoDiaSemana");
    var bodyRequest = jsonEncode({
                                  "key": "12345",
                                  "token": token,
                                  "inmueble": inmueble,
                                  "año": year,
                                  "mes": mes,
                                  "diaIni": diaIni,
                                  "diaFin": diaFin,
                                  "excel":"0"
                                });
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ReporteParqueoDiaSemana.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in reporteParqueoDiaSemana Service');
    }
  }

}


