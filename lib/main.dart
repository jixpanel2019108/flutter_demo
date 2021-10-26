// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/login.dart';
import 'package:flutter_demo/pages/forgotPassword.dart';
import 'package:flutter_demo/pages/conteoPersonas.dart';
import 'package:flutter_demo/pages/conteoParqueos.dart';
import 'package:flutter_demo/pages/reportePersonaAnualMes.dart';
import 'package:flutter_demo/pages/reportePersonaAnioMesHora.dart';
import 'package:flutter_demo/pages/reportePersonasMesesCincoAnual.dart';
import 'package:flutter_demo/pages/reportePersonasDia.dart';
import 'package:flutter_demo/pages/reportePersonaDiaSemana.dart';
import 'package:flutter_demo/pages/reportePersonasAnual.dart';
import 'package:flutter_demo/pages/principal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget 
  
  

  build(BuildContext context) {
    
    return MaterialApp(
      // home:FutureBuilder(
      //   future: _fbApp,
      //   builder: (context, snapshot){
      //     if(snapshot.hasError){
      //       print('Hay un error!!! ${snapshot.error.toString()}');
      //       return Text("Error");
      //     }else if(snapshot.hasData){
      //       return Text("Aqui va la pagina login");
      //     }else{
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   }),
      

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
        '/reporteDiario' : (context) => ReportePersonasDia(),
        '/reporteAnualMes' : (context) => ReportePersonaAnualMes(),
        '/reportePersonasMesesCinco' : (context) => reportePersonasMesesCincoAnual(),
        '/reporteAnioMesHora': (context) => ReportePersonaAnioMesHora(),
        '/reporteDiaSemana': (context) => ReportePersonaDiaSemana(),
      },
    );
  }
  
}

