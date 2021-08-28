// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/services/userService.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_demo/pages/forgotPassword.dart';

// ignore: camel_case_types
class loginScreen extends StatefulWidget {
  @override
  _login createState() => _login();
}

// ignore: camel_case_types
class _login extends State<loginScreen> {

  @override
  final usuario = TextEditingController();
  final password = TextEditingController();
  String usu = '';
  String pass = '';

  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _cuerpo(),
        ],)
        
        ,)
      
    );
  }

  Widget _cuerpo(){
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff000000),
          image: DecorationImage( image: AssetImage('assets/login-bg.jpg',),
          alignment: Alignment(0.0, 3.0),
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
              fit: BoxFit.cover
          )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(height: 100.0,),
           _logo(),
           SizedBox(height: 150.0,),
           _userTextField(),
           SizedBox(height: 15.0,),
           _passwordTextField(),
           SizedBox(height: 30.0,),
           _forgot(),
           SizedBox(height: 150.0,),
           _botonLogin(),
           SizedBox(height: 150.0,),
           _powered(),
         ],
        ),
      ),
    );
  }


  Widget _logo(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/logo_shoppertrace_blanco.png', height: 75.0,),


              ]

            )
          );
        }
    );
  }

  Widget _forgot(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('/forgotPassword');
                },
                child: Text('¿Has olvidado tu contraseña?',
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              )
          );
        }
    );
  }

  Widget _powered(){
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
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0), child: TextFormField(
                controller: usuario,
                keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
            hoverColor: Colors.white,
            fillColor: Colors.white,
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFE1EF8), width: 5.0),
            ),
            icon: Icon(Icons.account_circle_outlined,
              color: Color(0xffFE1EF8),),
            labelText: 'Correo Electronico',
            hintStyle: TextStyle(
              //decoration: ,
                color: Colors.white
            ),
            labelStyle: TextStyle(
                color: Colors.white
            ),

          ),
          ),)
              ],

          ),
            );
        }
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0), child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffFE1EF8), width: 5.0),
                    ),
                    icon: Icon(Icons.lock_outline_rounded,
                      color: Color(0xffFE1EF8),),
                    labelText: 'Contraseña',
                    //alignLabelWithHint: ,
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white
                    ),
                ),
                ),)
              ]
            ),
          );
        }
    );
  }

  Widget _botonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 20.0),
                child:
                Text('Iniciar Sesión',
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color(0xffFE1EF8),
              onPressed: (){
                usu = usuario.text;
                pass = password.text;

              UserService().loginUser(usu, pass);

              },
          );
        }
    );
  }

}
