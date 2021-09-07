//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/services/userService.dart';

class Menu extends StatefulWidget {
  final String token;
  final String nickname;
  final String email;
  const Menu({ Key key, this.token, this.nickname, this.email }) : super(key: key);
  @override
  _Menu createState() => _Menu();
}

class _Menu extends   State<Menu> {
  @override
  Widget build(BuildContext context){
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Color(0xffFE1EF8),
                child:DrawerHeader(
                /*decoration: BoxDecoration(
                  color: Color(0xffFE1EF8)
                ),*/
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset('assets/logo_shoppertrace_blanco.png'),
                    ),
                    Text(widget.token),
                    Text(widget.nickname)
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
    );
  }
}