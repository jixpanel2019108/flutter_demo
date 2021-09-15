//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/listMenuAppModel.dart';
import 'package:flutter_demo/pages/menu.dart';

class PersonasPage extends StatefulWidget{
  final String token;
  final String nickname;
  final String email;
  const PersonasPage({ Key key, this.token, this.nickname, this.email,}) : super(key: key);
  @override
  _PersonasPage createState() => _PersonasPage();
}

class _PersonasPage extends State<PersonasPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: MenuPage(token: widget.token, nickname: widget.nickname,email:widget.email,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            cuerpo()
          ],
        ),
      ),
    );
    /*return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: MenuPage(token: widget.token, nickname: widget.nickname,email:widget.email,),
      )
    );*/
  }

  Widget cuerpo(){
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            datosCabecera()
          ],
        ),
      ),
    );
  }

  Widget datosCabecera(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Text('Conteo Personas', 
          style: TextStyle(
            color: Color(0xffAF00FB),
            fontSize: 50,
            fontWeight: FontWeight.bold
          ),
          ),
          const SizedBox(height: 20,),
          Text('Usuario: '+'$widget.nickname',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15
            ),
          ),
          const SizedBox(height: 20,),
          Text('Ultima Actualización: '+'$widget.nickname',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15
          ),
          ),
          const SizedBox(height: 20,),
          Text('Ocupación maxima autorizada: '+'$widget.nickname',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15
          ),
          )
        ],
      ),
    );
  }
}