import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_demo/models/loginModel.dart';

// const urlBase = "https://demo.s3.gt/WS_SEGURIDAD_CPE/ws/";

class UserService{
  
  Future <LoginUser> loginUser (String userName, String password) async {

    String url = "https://demo.s3.gt/WS_SEGURIDAD_CPE/ws/post/loginUser";
    final http.Response response = await http.post(Uri.parse(url),
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

}

