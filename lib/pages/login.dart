import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static String id = 'Login';
   

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  String _passGuardada = '';
  String _emailGuardado = '';
  final emailController = TextEditingController(text: '');
  final passController = TextEditingController(text: '');

  Widget build(BuildContext context) {
    obtenerPass();
    obtenerEmail();
    return Scaffold(
      body: _cuerpo(),
    );
  }

  Widget _cuerpo(){
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff000000),
          image: DecorationImage( image: AssetImage('assets/login-bg.jpg',),
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
           SizedBox(height: 20.0,),
           Text('¿Has olvidado tu contraseña?',
           style: TextStyle(
             color: Colors.white
           ),
           ),
           SizedBox(height: 100.0,),
           _botonLogin(),
           SizedBox(height: 100.0,),
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

  /*                    Text('Powered By',
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),*/

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
                controller: emailController,
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
                  controller: passController,
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
              onPressed: (){_guardarPassword();},
          );
        }
    );
  }

  Future<void> obtenerPass() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _passGuardada = preferences.get("pass")??"12345";
    });

  }

  _guardarPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("pass", emailController.text);
    preferences.setString("email", emailController.text)
  }

  Future<void> obtenerEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _emailGuardado = preferences.get("email")??"suemail@gmail.com";
    });
  }
   }

  /*Widget _fondo(){
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 100.0,),
              _logo(),
              SizedBox(height: 150.0,),
              _userTextField(),
              SizedBox(height: 15.0,),
              _passwordTextField(),
              SizedBox(height: 15.0,),
              SizedBox(height: 100.0,),
              _botonLogin(),
              SizedBox(height: 200.0,),
              _powered()
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage( image: AssetImage('assets/login-bg.jpg'),
        fit: BoxFit.cover
        )
      ),
    );
  }*/
}
