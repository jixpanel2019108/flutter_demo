//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/listMenuAppModel.dart';
import 'package:flutter_demo/pages/conteoParqueos.dart';
import 'package:flutter_demo/pages/conteoPersonas.dart';
import 'package:flutter_demo/pages/reportePersonasAnual.dart';
import 'package:flutter_demo/pages/reportePersonasDia.dart';
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
  List<Menu> menuIn = [];
  
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
              text: 'Reporte Personas Anual',
              icon: Icons.people,   
              indice: 5
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Reporte Personas Diario',
              icon: Icons.people,   
              indice: 6
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Reporte Personas Mes Anual',
              icon: Icons.people,   
              indice: 7
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

        // child: ListView(
        //   // Important: Remove any padding from the ListView.
        //   padding: EdgeInsets.zero,
        //   children: [
        //     DrawerHeader(
        //       decoration: BoxDecoration(
        //         color: Color(0xffFE1EF8),
        //       ),
        //       child: Column(
        //         children: [
        //           const SizedBox(height: 40),
        //           Expanded(
        //             child: Image.asset('assets/logo_shoppertrace_blanco.png'),
        //           ),
        //           const SizedBox(height: 10),
        //           Text(widget.nickname, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        //           const SizedBox(height: 5),
        //           Text(widget.email, style: TextStyle(color: Colors.white),)
        //         ],
        //       ),
        //     ),
        //     ListView.builder(
        //       itemCount: menuIn.length ?? 0,
        //           itemBuilder: (BuildContext context, int index) {
        //             return ListTile(
        //             title: Text('Item ${index + 1}'),
        //            );
        //           },
        //       )
        //   ],
        // ),
        
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
      title: Text(text, style: TextStyle(color: color, 
      fontFamily: 'Gotic'
      )),
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
            UserService userService = new UserService();
            userService.razonSocial(widget.token).then((peticionRazonSocial) => {
              if(peticionRazonSocial.error == false){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonasPage(
                      token: widget.token,
                      email: widget.email,
                      nickname: widget.nickname,
                      listadoRazon: peticionRazonSocial.listado,
                    )
                  )
                )   
              }else{
                print('Error en boton menu Conteo Personas')
              }
            });
            
          }
          break;
          case 4: {
            UserService userService = new UserService();
            userService.razonSocial(widget.token).then((peticionRazonSocial) => {
              if(peticionRazonSocial.error == false){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ParqueosPage(
                      token: widget.token,
                      email: widget.email,
                      nickname: widget.nickname,
                      listadoRazon: peticionRazonSocial.listado,
                    )
                  )
                )
              }else{
                print('Error en boton menu Conteo Parqueos')
              }
            });
          }
          break;
          case 5: {
            UserService userService = new UserService();
            userService.razonSocial(widget.token).then((peticionRazonSocial) => {
              if(peticionRazonSocial.error == false){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportePersonasAnual(
                      token: widget.token,
                      email: widget.email,
                      nickname: widget.nickname,
                      listadoRazon: peticionRazonSocial.listado,
                    )
                  )
                )
              }else{
                print('Error en boton menu Conteo Parqueos')
              }
            });
          }
          break;
          case 6: {
            UserService userService = new UserService();
            userService.razonSocial(widget.token).then((peticionRazonSocial) => {
              if(peticionRazonSocial.error == false){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportePersonasDia(
                      token: widget.token,
                      email: widget.email,
                      nickname: widget.nickname,
                      listadoRazon: peticionRazonSocial.listado,
                    )
                  )
                )
              }else{
                print('Error en boton menu Conteo Parqueos')
              }
            });
          }
          break;
          case 7: {
            UserService userService = new UserService();
            userService.razonSocial(widget.token).then((peticionRazonSocial) => {
              if(peticionRazonSocial.error == false){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportePersonasDia(
                      token: widget.token,
                      email: widget.email,
                      nickname: widget.nickname,
                      listadoRazon: peticionRazonSocial.listado,
                    )
                  )
                )
              }else{
                print('Error en boton menu Conteo Parqueos')
              }
            });
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
  