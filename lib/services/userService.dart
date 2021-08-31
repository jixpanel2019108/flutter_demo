// @dart=2.9

import 'dart:async';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/login.dart';
import 'package:flutter_demo/services/api_base_helper.dart';
import 'package:flutter_demo/models/loginModel.dart';
import 'package:flutter_demo/utils/user_simple_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// const urlBase = "https://demo.s3.gt/WS_SEGURIDAD_CPE/ws/";

class UserService{
  String url = "https://demo.s3.gt/WS_SEGURIDAD_CPE/ws/post";
  
  Future <void> loginUser (String userName, String password) async {

    final http.Response response = await http.post(Uri.parse(url+"/loginUser"),
      headers: <String,String>{ "Content-Type": "application/json"},
      body: jsonEncode({"nombre_usuario": userName, "clave": password, "key": "12345"}));
      
        final body = json.decode(response.body);
        print(body);
        print(body['token']);

        
        if(body['error'] == false){
          final String token = body['token'];
          await UserSimplePreferences.setUserName(userName);
          await UserSimplePreferences.setToken(token);
        }else if (body['error'] == true){
          final String mensaje = body['msg'];
          // aquí se pone la alerta!
          dialogContent(BuildContext context){
            showDialog(
              context: context,
              builder: (context) => alertaError(
                title: 'Error',
                description: '$mensaje',
              )
            );
          }
        }
  }

  Future <void> forgotPasswordService (String user) async {
    
    var urlRequest = Uri.parse(url+"/forgotpassword");

    var bodyRequest = jsonEncode({"user": user, "key": "12345"});
    var responseJson;
    
      final http.Response response = await http.post(urlRequest, 
                                    headers: <String,String>{ "Content-Type": "application/json"},
                                    body: bodyRequest);
      responseJson = returnResponse(response);
      
      var body = jsonDecode(response.body);

      print(body);
      if(body['error'] == false){
        final String mensaje = body['msg'];
        // alerta de exito
      }else{
        final String mensaje = body['msg'];
        // alerta de fallo
      }
    
  }
  
}



