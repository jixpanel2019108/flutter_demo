//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/userModel.dart';
import 'package:flutter_demo/models/listMenuAppModel.dart';
import 'package:flutter_demo/pages/conteoPersonas.dart';
import 'package:flutter_demo/services/userService.dart';

class MenuPage extends StatefulWidget {
  final String token;
  final String nickname;
  final String email;
  final List<Menu> menu;
  const MenuPage({ Key key, this.token, this.nickname, this.email, this.menu }) : super(key: key);
  @override
  _MenuPage createState() => _MenuPage();
}

class _MenuPage extends   State<MenuPage> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  
  @override
  Widget build(BuildContext context){

    return Drawer(
      child: Material(
        color: Color(0xffFE1EF8),
        child: ListView(
          padding: padding,
          children: <Widget> [
            const SizedBox(height: 48),
            Image.asset('assets/logo_shoppertrace_blanco.png', height: 75.0,),
            const SizedBox(height: 16),
            Text(widget.nickname, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            Text(widget.email, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            const SizedBox(height: 30),
            Divider(color: Colors.white70),
            const SizedBox(height: 24),
            buildMenuItem(
              text: 'Seguridad Usuarios',
              icon: Icons.lock,
              indice: 1
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Permisos',
              icon: Icons.lock,
              indice: 2
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Conteos Personas',
              icon: Icons.people_alt,
              indice: 3
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Conteos Parqueos',
              icon: Icons.people_alt,
              indice: 4
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Personas por año',
              icon: Icons.people,   
              indice: 5
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white70),
            const SizedBox(height: 24),
            logoutApp(
              text: 'Exit',
              icon: Icons.exit_to_app
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    int indice
  }) {
    final color = Colors.white;
    final hoverColor = Color(0xffAF00FB);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: () {
        switch(indice){
          case 1: {

          }
          break;
          case 2: {

          }
          break;
          case 3: {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonasPage(
                  token: widget.token,
                  email: widget.email,
                  nickname: widget.nickname,
                )
              )
            );
          }
          break;
          case 4: {

          }
          break;
        }
      },
    );
  }

  Widget logoutApp({
    String text,
    IconData icon,
  }){
    final color = Colors.white;
    final hoverColor = Color(0xffAF00FB);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: () {
        UserService userService = new UserService();
        userService.logout(widget.token).then((usuarioFuera) => {
          if(usuarioFuera.error == false){
            Navigator.of(context).pushNamed('/login')
          }else{
            throw Exception('Hubo un error al deslogearse')
          }
        });
        //Navigator.of(context).pushNamed('/login');
      },
    );
  }

  /*Widget menuList(){
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.menu.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(widget.menu[index].menu),
            onTap: (){
              switch(widget.menu[index].menu){
                case '5':{
                  print('Menu numero 1');
                }
                break;
                case '6':{
                  print('El siguiente al anterior');
                }
                break;
                case '8':{
                  print('El siguiente al anterior del anterior');
                }
                break;
                default:{
                  print('hola');
                }
              }
            },
          );
        },
      ),
    );
  }*/

}
