// @dart=2.9

import 'dart:async';
import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/userModel.dart';
import 'package:flutter_demo/pages/login.dart';
import 'package:flutter_demo/services/api_base_helper.dart';
import 'package:flutter_demo/models/loginModel.dart';
import 'package:flutter_demo/services/app_exceptions.dart';
import 'package:flutter_demo/utils/user_secure_storage.dart';
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

        if(body['error'] == false){
          final String token = body['token'];
          print(token);
          await UserSimplePreferences.setUserName(userName);
          await UserSimplePreferences.setToken(token);

          listPerfilService(token);
          
          listMenuService(token);
          return true;
          

        }else if (body['error'] == true){
          final String mensaje = body['msg'];

          return false;
          // aquí se pone la alerta!
          // dialogContent(BuildContext context){
          //   showDialog(
          //     context: context,
          //     builder: (context) => alertaError(
          //       title: 'Error',
          //       description: '$mensaje',
          //     )
          //   );
          // }
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
  
  Future <void> listPerfilService(String token) async {
    // User usuario = new User();
    final http.Response response = await http.post(Uri.parse(url+"/listPerfil"),
                                    headers: <String,String>{ "Content-Type": "application/json"},
                                    body: jsonEncode({"key": "12345","token": token}));

    final body = json.decode(response.body);
    print(body);
      if(body['error'] == false){

        final String last_name01 = body['last_name01'];
        final String name02 = body['name02'];
        final String last_name02 = body['last_name02'];
        final String name01 = body['name01'];
        final String rpas = body['rpas'];
        final String nickname = body['nickname'];
        final String photo = body['photo'];
        final String id = body['id'];        
        final String email = body['email'];

        UserSimplePreferences.setLast_name01(last_name01);
        UserSimplePreferences.setName02(name02);
        UserSimplePreferences.setLast_name02(last_name02);
        UserSimplePreferences.setName01(name01);
        UserSimplePreferences.setRpas(rpas);
        UserSimplePreferences.setNickname(nickname);
        UserSimplePreferences.setPhoto(photo);
        UserSimplePreferences.setId(id);
        UserSimplePreferences.setEmail(email);
        
        // loginScreen();
        print(UserSimplePreferences.getUsername());
      }else if (body['error'] == true){
        
      }
  }

  Future <void> listMenuService(String token) async {
    final http.Response response = await http.post(Uri.parse(url+"/listMenuApp"),
                                headers: <String,String>{ "Content-Type": "application/json"},
                                    body: jsonEncode({"key": "12345","token": token}));

    final body = json.decode(response.body);
    print(body);

    if(body['error'] == false){
      print("List menu exitoso");
      var menu = body['menu'];
      

    }else if (body['error'] == true){
      print("List menu con error");
    }


  }

  Future <List<User>> listPerfilPrueba(String token) async {
    // User usuario = new User();
    var responseJson;
    
    final http.Response response = await http.post(Uri.parse(url+"/listPerfil"),
                                    headers: <String,String>{ "Content-Type": "application/json"},
                                    body: jsonEncode({"key": "12345","token": token}));

    final body = json.decode(response.body);
    // responseJson = returnResponse(response);
    print(body);
    
    
    
    
    return usersResponseFromJson(responseJson).users;
  }

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
          print("Error");
          throw Exception('Failed to load');
        }
  }


}



