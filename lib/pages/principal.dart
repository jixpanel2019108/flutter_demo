//@dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/services/userService.dart';
import 'package:flutter_demo/utils/user_secure_storage.dart';
import 'package:flutter_demo/utils/user_simple_preferences.dart';
import 'package:http/http.dart';


class HomeScreen extends StatefulWidget {
  final String token;
  const HomeScreen({ Key key, this.token }) : super(key: key);
  
  @override
  _Home createState() => _Home();
}

// ignore: camel_case_types
class _Home extends State<HomeScreen> {

  

  @override

  Widget build(BuildContext context) {
    final String email = UserSimplePreferences.getEmail();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                child:DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xffFE1EF8)
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset('assets/logo_shoppertrace_blanco.png'),
                    ),
                    
                    Text(widget.token),
                  ],
                ),
              ), 
              ),
              Container(
                color: Color(0xffFE1EF8),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Contactos'),
                    ),
                    ListTile(
                      title: Text('Contactos'),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      
      )
        
    );
  }
}
