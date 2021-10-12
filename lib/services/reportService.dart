//@dart=2.9

import 'dart:async';
import 'dart:convert';
import 'package:flutter_demo/models/reportePersonaAnualMesModel.dart';
import 'package:flutter_demo/models/reportePersonaDiaModel.dart';
import 'package:flutter_demo/models/reportePersonasMesesCincoAnual.dart';
import 'package:http/http.dart' as http;

class ReportService{

  String urlReporte = "https://demo.s3.gt/cargainventarios/ws/post";

  Future <ReportePersonaDia> reportePersonaDia (String token, String inmueble, String mes, String year) async{
    print(inmueble);
    print(mes);
    print(year);
    var urlRequest = Uri.parse(urlReporte+"/reportePersonaDia");
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
      return ReportePersonaDia.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in reportePersonaDia Service');
    }

  }

  Future <ReportePersonaAnualMes> reportePesonaAnualMes (String token,String usuario, String inmueble, String aini, String afin, String mes) async{

    print(inmueble);
    print(aini);
    print(afin);
    print(mes);
    

    var urlRequest = Uri.parse(urlReporte+"/reportePersonaAnualMes");
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
      return ReportePersonaAnualMes.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in reportePersonaAnualMes Service');
    }
  }

  Future <ReportePersonasMesesCincoAnual> reportePersonasMesesCincoAnual (String token,String usuario, String inmueble, String aini, String afin, String mes) async{

    print(inmueble);
    print(aini);
    print(afin);
    print(mes);
    

    var urlRequest = Uri.parse(urlReporte+"/reportePersonasMesesCincoAnual");
    var bodyRequest = jsonEncode({
                                    "key": "12345",
                                    "token": token,
                                    "inmueble": inmueble,
                                    "aini": aini,
                                    "afin": afin,
                                    "mes": mes,
                                    "excel":"0"
                                  });
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ReportePersonasMesesCincoAnual.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in reportePersonaAnualMes Service');
    }
  }



}

