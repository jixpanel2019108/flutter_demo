//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/menu.dart';



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
    //final String email = UserSimplePreferences.getEmail();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Menu()
        ],)
        
        ,)
      
    );
  }
}