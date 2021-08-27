// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/login.dart';
import 'package:flutter_demo/pages/forgotPassword.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
       '/login': (context) => loginScreen(),
        '/forgotPassword': (context) => forgotScreen()
      },
    );
  }
}

