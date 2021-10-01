// @dart=2.9

import 'dart:async';
import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catCentroComercialModel.dart';
import 'package:flutter_demo/models/catRazonSocialModel.dart';
import 'package:flutter_demo/models/conteoParqueosModel.dart';
import 'package:flutter_demo/models/conteoPersonasModel.dart';
import 'package:flutter_demo/models/forgotPasswordModel.dart';
import 'package:flutter_demo/models/listMenuAppModel.dart';
import 'package:flutter_demo/models/listMenuModel.dart';
import 'package:flutter_demo/models/listPerfilModel.dart';
import 'package:flutter_demo/models/logoutModel.dart';
import 'package:flutter_demo/models/reportePersonasAnualModel.dart';
import 'package:flutter_demo/models/userModel.dart';
import 'package:flutter_demo/pages/login.dart';
import 'package:flutter_demo/services/api_base_helper.dart';
import 'package:flutter_demo/models/loginModel.dart';
import 'package:flutter_demo/services/app_exceptions.dart';
import 'package:flutter_demo/utils/user_secure_storage.dart';
import 'package:flutter_demo/utils/user_simple_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class UserService{
  String url = "https://demo.s3.gt/WS_SEGURIDAD_CPE/ws/post";
  String urlCatalogo = "https://demo.s3.gt/WS_CATALOGOS/ws/post";
  String urlCargaInventario = "https://demo.s3.gt/cargainventarios/ws/post";
  
  Future <LoginResponseModel> login (String userName, String password) async {

    final http.Response response = await http.post(Uri.parse(url+"/loginUser"),
      headers: <String,String>{ "Content-Type": "application/json"},
      body: jsonEncode({"nombre_usuario": userName, "clave": password, "key": "12345"}));
      
        final body = json.decode(response.body);

        if(response.statusCode == 200 || response.statusCode == 202){
          print(body);
          final String token = body['token'];
          UserSimplePreferences.setToken(token);
          return LoginResponseModel.fromJson(json.decode(response.body));
        }else{
          throw Exception('Failed to load in login Service');
        }
  }

  Future <ForgotPasswordResponse> forgotPassword (String user) async{
    var urlRequest = Uri.parse(url+"/forgotpassword");
    var bodyRequest = jsonEncode({"user": user, "key": "12345"});
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ForgotPasswordResponse.fromJson(json.decode(response.body));
    }else{
      print("Error");
      throw Exception('Failed to load in forgotPassword Service');
    }

  }

  Future <ListPerfilResponseModel> listPerfil(String token) async {
    
    final http.Response response = await http.post(Uri.parse(url+"/listPerfil"),
                                    headers: <String,String>{ "Content-Type": "application/json"},
                                    body: jsonEncode({"key": "12345","token": token}));
    final body = json.decode(response.body);
    
    if(response.statusCode == 200 || response.statusCode == 202){
      // print(body);
      return ListPerfilResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in listPerfil Service');
    }
  }

  Future <ListMenuResponse> listMenu (String token) async {
    final http.Response response = await http.post(Uri.parse(url+"/listMenu"),
                                headers: <String,String>{ "Content-Type": "application/json"},
                                body: jsonEncode({"key": "12345","token": token}));
    
    final body = json.decode(response.body);
    print(body);

    if(response.statusCode == 200 || response.statusCode == 202){
      return ListMenuResponse.fromJson(json.decode(response.body));
    } else {
      throw('Failed to load in listMenu Service');
    }

  }

  Future <ListMenuAppResponse> listMenuApp (String token) async {
    final http.Response response = await http.post(Uri.parse(url+"/listMenuApp"),
                                headers: <String,String>{ "Content-Type": "application/json"},
                                body: jsonEncode({"key": "12345","token": token}));
    
    final body = json.decode(response.body);
    print(body);

    if(response.statusCode == 200 || response.statusCode == 202){
      return ListMenuAppResponse.fromJson(json.decode(response.body));
    } else {
      throw('Failed to load in listMenu Service');
    }

  }

  Future <LogoutResponse> logout (String token) async{
    var urlRequest = Uri.parse(url+"/logout");
    var bodyRequest = jsonEncode({"key": "12345", "token": token});
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return LogoutResponse.fromJson(json.decode(response.body));
    }else{
      print("Error");
      throw Exception('Failed to load in logout Service');
    }

  }

  Future <CatRazonSocialResponseModel> razonSocial (String token) async {
    var urlRequest = Uri.parse(urlCatalogo+"/catRazonSocial");
    var bodyRequest = jsonEncode({"key": "12345", "token": token});
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return CatRazonSocialResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in razonSocial Service');
    }
  }
  
  Future <CatCentroComercialResponseModel> centroComercial (String token, String razon) async {
    var urlRequest = Uri.parse(urlCatalogo+"/catCentroComercial");
    var bodyRequest = jsonEncode({"key": "12345", "token": token, "razon": razon});
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return CatCentroComercialResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in centroComercial Service');
    }
  }

  Future <ConteoPersonasResponseModel> conteoPersonas (String token, String usuario, DateTime fecha, String razon, String ocupacion, String alerta, String comercial) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String fechaString = formatter.format(fecha);

    var urlRequest = Uri.parse(urlCargaInventario+"/conteoPersonas");
    var bodyRequest = jsonEncode({
                                  "key": "12345",
                                  "token": token,
                                  "usuario": usuario, 
                                  "fecha": fechaString,
                                  "razon": razon,
                                  "excel": "0",
                                  "ocupacionMaximaAutorizada": ocupacion,
                                  "alertaOcupacion": alerta,
                                  "comercial": comercial
                                  });
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ConteoPersonasResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in conteoPersonas Service');
    }
  }

  Future <ConteoParqueosResponseModel> conteoParqueos (String token, String usuario, DateTime fecha, String razon, String ocupacion, String alerta, String comercial) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String fechaString = formatter.format(fecha);
    var urlRequest = Uri.parse(urlCargaInventario+"/conteoPersonas");
    var bodyRequest = jsonEncode({
                                  "key": "12345",
                                  "token": token,
                                  "usuario": usuario, 
                                  "fecha": fechaString,
                                  "razon": razon,
                                  "excel": "0",
                                  "ocupacionMaximaAutorizada": ocupacion,
                                  "alertaOcupacion": alerta,
                                  "comercial": comercial
                                  });
    
    final http.Response response = await http.post(urlRequest, 
                                      headers: <String,String>{ "Content-Type": "application/json"},
                                      body: bodyRequest);
    final body = json.decode(response.body);

    if(response.statusCode == 200 || response.statusCode == 202){
      print(body);
      return ConteoParqueosResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in conteoParqueos Service');
    }
  }

  Future <ReportePersonasAnualResponseModel> reportePersonasAnual (String token, String inmueble, String fini, String ffin) async {
    var urlRequest = Uri.parse(urlCargaInventario+"/conteoPersonas");
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
      return ReportePersonasAnualResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load in conteoParqueos Service');
    }
  }
}



