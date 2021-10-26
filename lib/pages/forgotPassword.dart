// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/services/userService.dart';

//flutter run --no-sound-null-safety

// ignore: camel_case_types
class forgotScreen extends StatefulWidget {
  @override
  _forgotState createState() => _forgotState();
}

// ignore: camel_case_types
class _forgotState extends State<forgotScreen> {

  final usuario = TextEditingController();
  String usu = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _cuerpo(),
          ],),
      )
       
    );
  }

  Widget _cuerpo() {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff000000),
          image: DecorationImage(image: AssetImage('assets/login-bg.jpg',),
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              fit: BoxFit.cover
          )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.0,),
            _logo(),
            SizedBox(height: 80.0,),
            _userTextField(),
            SizedBox(height: 150.0,),
            _botonLogin(),
            SizedBox(height: 150.0,),
            _powered(),
          ],
        ),
      ),
    );
  }


  Widget _logo() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/logo_shoppertrace_blanco.png', height: 75.0,),


                  ]

              )
          );
        }
    );
  }

  Widget _powered() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Powered By',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    Image.asset('assets/logoS3.png', height: 35.0,
                    ),
                  ]

              )
          );
        }
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              controller: usuario,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFE1EF8), width: 5.0),
                ),
                icon: Icon(Icons.email_outlined,
                  color: Color(0xffFE1EF8),),
                labelText: 'Correo Electronico',
                labelStyle: TextStyle(
                    color: Colors.white
                ),

              ),
              onChanged: (value) {

              },
            ),
          );
        }
    );
  }

  Widget _botonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: RaisedButton.icon(
              padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 20.0),
              onPressed: (){
                usu = usuario.text;
                print(usu);
                // UserService().forgotPasswordService(usu);
                UserService userService = new UserService();

                userService.forgotPassword(usu).then((response) => {
                  if (response.error == false) {
                    print(response.msg),
                    // Insertar alerta de exito con el valor del response.msg 
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Color(0xffFE1EF8),
                    content:  Text(response.msg),
                    duration: const Duration(seconds: 1),
                  ))
                  } else {
                    print(response.msg),
                    //Insertar alerta de error con el valor del response.msg
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.redAccent,
                    content:  Text(response.msg),
                    duration: const Duration(seconds: 5),
                    
                  ))
                  }
                }); 
              },
              icon: Icon(Icons.send,
              color: Colors.white,),
              label: Text('Enviar correo',
              style: TextStyle(
                color: Colors.white
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color(0xffFE1EF8),
              ),
          );
        }
    );
  }
}