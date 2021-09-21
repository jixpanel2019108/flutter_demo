//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/menu.dart';
import 'package:flutter_demo/models/listMenuAppModel.dart';

class HomeScreen extends StatefulWidget {
  final String token;
  final String nickname;
  final String email;
  final List<Menu> menu;
  const HomeScreen({ Key key, this.token, this.nickname, this.email, this.menu }) : super(key: key);
  
    @override
    _Home createState() => _Home();
}

// ignore: camel_case_types
class _Home extends State<HomeScreen> {

  @override

  Widget build(BuildContext context) {
    //final String email = UserSimplePreferences.getEmail();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: MenuPage(token: widget.token, nickname: widget.nickname,email:widget.email,),
      )
    );
  }
}