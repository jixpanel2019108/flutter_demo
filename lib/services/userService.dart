import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_demo/models/loginModel.dart';
import 'package:flutter_demo/models/forgotPasswordModel.dart';

// const urlBase = "https://demo.s3.gt/WS_SEGURIDAD_CPE/ws/";

class UserService{
  String url = "https://demo.s3.gt/WS_SEGURIDAD_CPE/ws/post";
  
  Future <LoginUser> loginUser (String userName, String password) async {

    final http.Response response = await http.post(Uri.parse(url+"/loginUser"),
      headers: <String,String>{ "Content-Type": "application/json"},
      body: jsonEncode({"nombre_usuario": "JZETINA", "clave": "ADMIN", "key": "12345"}));
      try{ 
        print(response.body);
        return LoginUser.fromJson(json.decode(response.body));
      }catch(e){
        print(e);
        return LoginUser(nombre_usuario:"", clave: "", key: "");
      }
  }

  Future forgotPasswordService (String user, String key) async {
    
    var urlRequest = Uri.parse(url+"/forgotPassword");
    var bodyRequest = jsonEncode({"user": user, "key": key});

    final http.Response response = await http.post(urlRequest, 
    headers: <String,String>{ "Content-Type": "application/json"},
    body: bodyRequest);
    
    try{
      print(response);
      return ForgotPassword.fromJson(json.decode(response.body));
    }catch(e){
      print(e);
      return response.statusCode;
    }
  }
  
}

