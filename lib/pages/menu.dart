//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/listMenuAppModel.dart';
import 'package:flutter_demo/pages/conteoParqueos.dart';
import 'package:flutter_demo/pages/conteoPersonas.dart';
import 'package:flutter_demo/pages/reportePersonasAnual.dart';
import 'package:flutter_demo/pages/reportePersonasDia.dart';
import 'package:flutter_demo/pages/reportePersonaAnualMes.dart';
import 'package:flutter_demo/pages/reportePersonaAnioMesHora.dart';
import 'package:flutter_demo/pages/reportePersonasMesesCincoAnual.dart';
import 'package:flutter_demo/pages/reportePersonaDiaSemana.dart';
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
  String value1;
  
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
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Reporte Personas Meses Anual',
              icon: Icons.people,   
              indice: 8
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Reporte Hora Mes',
              icon: Icons.calendar_today,
              indice: 9
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Reporte Semana Dia',
              icon: Icons.calendar_today,
              indice: 10
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

  
  /*Widget dropdown1(){
    List menu1 = [];
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFE1EF8), width: 2),
        borderRadius: BorderRadius.circular(10)
      ),

      child: DropdownButton(
        hint: Text('Selecciona una Razón', style: TextStyle(fontSize: 15, color: Color(0xffe1c0ea)),),
        dropdownColor: Colors.grey,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        underline: SizedBox(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15
        ),
        value: value1,
        onChanged: (newValue){
          setState(() {
            value1 = newValue;
          });
        },
        items: menu1.map((listado){
          return DropdownMenuItem(
            value: '${listado.value}',
            child: Text('${listado.value}', style: TextStyle(color: Color(0xffe1c0ea)),),
            onTap: (){
              idRazon = listado.id;
              UserService userService = new UserService();
              userService.centroComercial(widget.token, listado.id).then((centrosComerciales) =>{
                if(centrosComerciales.error == true){
                  print('Error al obtener los inmuebles')
                }else{
                  menu1 = centrosComerciales.listado,
                  //this.listadoComercial = this.listadoComercial,
                  this.pruebalista = menu1 != null? menu1 : <comercial.Listado>[]
                }

              });
            },
          );
        }).toList()
      ), 
    );
  }*/

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
                    builder: (context) => ReportePersonaAnualMes(
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
          case 8: {
            UserService userService = new UserService();
            userService.razonSocial(widget.token).then((peticionRazonSocial) => {
              if(peticionRazonSocial.error == false){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => reportePersonasMesesCincoAnual(
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
          case 9: {
            UserService userService = new UserService();
            userService.razonSocial(widget.token).then((peticionRazonSocial) => {
              if(peticionRazonSocial.error == false){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportePersonaAnioMesHora(
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
          case 10: {
            UserService userService = new UserService();
            userService.razonSocial(widget.token).then((peticionRazonSocial) => {
              if(peticionRazonSocial.error == false){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportePersonaDiaSemana(
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
  