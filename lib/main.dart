// @dart=2.9

import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/login.dart';
import 'package:flutter_demo/pages/forgotPassword.dart';
import 'package:flutter_demo/pages/conteoPersonas.dart';
import 'package:flutter_demo/pages/conteoParqueos.dart';
import 'package:flutter_demo/pages/reportePersonasDiario.dart';
import 'package:flutter_demo/utils/user_simple_preferences.dart';
import 'package:flutter_demo/pages/reportePersonasAnual.dart';
import 'package:flutter_demo/pages/principal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UserSimplePreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple,),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
       '/login': (context) => loginScreen(),
        '/forgotPassword': (context) => forgotScreen(),
        '/principal' : (context) => HomeScreen(),
        '/conteoPersonas' : (context) => PersonasPage(),
        '/conteoParqueos' : (context) => ParqueosPage(),
        '/reporteAnual' : (context) => ReportePersonasAnual(),
        '/reporteDiario' : (context) => ReportePersonasDiario(),
      },
    );
  }
}

