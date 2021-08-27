import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/services/userService.dart';

class Login extends StatefulWidget {
  static String id = 'Login';


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  forgotPasswordFunction() async {
    UserService().forgotPasswordService("jose.zetina@soft3plus.com","12345");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cuerpo(),
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
            SizedBox(height: 150.0,),
            _userTextField(),
            SizedBox(height: 20.0,),
            Text('¿Has olvidado tu contraseña?',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            SizedBox(height: 100.0,),
            _botonLogin(),
            SizedBox(height: 80.0,),
            _poweredby(),
            SizedBox(height: 85.0,),
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
                    Image.asset('assets/logoS3.png', height: 35.0,
                    ),
                  ]

              )
          );
        }
    );
  }

  Widget _poweredby() {
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hoverColor: Colors.white,
                fillColor: Colors.white,
                focusColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFE1EF8), width: 5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 5.0),
                ),
                icon: Icon(Icons.account_circle_outlined,
                  color: Color(0xffFE1EF8),),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo Electronico',
                hintStyle: TextStyle(
                  //decoration: ,
                    color: Colors.white
                ),
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
              onPressed: () {}
          );
        }
    );
  }
}