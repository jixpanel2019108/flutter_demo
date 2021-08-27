// @dart=2.9

import 'package:flutter_demo/services/api_base_helper.dart';
import 'package:flutter_demo/models/loginModel.dart';
import 'package:flutter_demo/services/app_exceptions.dart';
import 'package:flutter_demo/models/forgotPasswordModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

// const urlBase = "https://demo.s3.gt/WS_SEGURIDAD_CPE/ws/";

class UserService{
  String url = "https://demo.s3.gt/WS_SEGURIDAD_CPE/ws/post";
  
  Future <LoginUser> loginUser (String userName, String password) async {

    final http.Response response = await http.post(Uri.parse(url+"/loginUser"),
      headers: <String,String>{ "Content-Type": "application/json"},
      body: jsonEncode({"nombre_usuario": userName, "clave": password, "key": "12345"}));
      try{ 
        print(response.body);
        return LoginUser.fromJson(json.decode(response.body));
      }catch(e){
        print(e);
        return LoginUser(nombre_usuario:"", clave: "", key: "");
      }
  }

  Future <http.Response>forgotPasswordService (String user, String key) async {
    
    var urlRequest = Uri.parse(url+"/forgotPassword");
    var bodyRequest = jsonEncode({"user": user, "key": key});
    var responseJson;
    
    
    try{
      final http.Response response = await http.post(urlRequest, 
        headers: <String,String>{ "Content-Type": "application/json"},
        body: bodyRequest);
        responseJson = returnResponse(response);
        print(responseJson);
    }catch (e){
      print(e);
    }

    return responseJson;
  }
  
}

