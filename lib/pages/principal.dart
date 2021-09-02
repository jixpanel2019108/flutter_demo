import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/services/userService.dart';
import 'package:flutter_demo/utils/user_simple_preferences.dart';

class homeScreen extends StatefulWidget {
  @override
  _home createState() => _home();
}

// ignore: camel_case_types
class _home extends State<homeScreen> {

  @override

  Widget build(BuildContext context) {
    final String nickname = UserSimplePreferences.getNickname();
    final String email = UserSimplePreferences.getEmail();
    print(nickname);
    print(email);
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
                    
                    Text('$nickname'),
                    Text('$email'),
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
