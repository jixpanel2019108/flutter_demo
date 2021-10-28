//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/listMenuModel.dart';
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

  const MenuPage({Key key, this.token, this.nickname, this.email, this.menu})
      : super(key: key);
  @override
  _MenuPage createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {
  final padding = EdgeInsets.symmetric(horizontal: 5);
  List<Menu> menuIn = [];
  String value1;

  @override
  Widget build(BuildContext context) {
    // return listado();

    return Drawer(
      child: new Container(
          color: Color(0xffFE1EF8),
          child: ListView(children: [
            const SizedBox(height: 48),
            Image.asset('assets/logo_shoppertrace_blanco.png', height: 50.0,),
            const SizedBox(height: 16),
            Text(widget.nickname, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            Text(widget.email, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            
            const SizedBox(height: 24),
                Divider(color: Colors.white70),
                const SizedBox(height: 24),
            new Container(
                color: Color(0xffFE1EF8),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.menu.length ?? 0 ,
                  itemBuilder: (context, i) {

                    IconData figura = IconData(0xe3ae, fontFamily: 'MaterialIcons');;
                    if(widget.menu[i].icono == "lock"){
                     figura = IconData(0xe3ae, fontFamily: 'MaterialIcons');
                    }else if(widget.menu[i].icono == "group_add"){
                     figura = IconData(0xe377, fontFamily: 'MaterialIcons');
                    }else if(widget.menu[i].icono == "insert_chart"){
                     figura = IconData(0xe33f, fontFamily: 'MaterialIcons');
                    }else {
                      figura = IconData(0xe3ae, fontFamily: 'MaterialIcons');
                    }
                    return new ExpansionTile(
                      leading: new Icon(figura),
                      title: new Text(widget.menu[i].menu1 ?? widget.menu[i].menu2 ?? widget.menu[i].menu3,style: TextStyle(color: Colors.white, fontSize: 16)),
                      children: <Widget>[
                        new Column(
                          children: _buildExpandableContent(widget.menu[i]),
                        ),
                      ],
                    );
                  },
                )),
                const SizedBox(height: 24),
                Divider(color: Colors.white70),
                const SizedBox(height: 24),
                logoutApp(
                text: 'Exit',
                icon: Icons.exit_to_app
            ),
          ]),
          
          
          ),

      // child: Material(

      //     color: Color(0xffFE1EF8),
      //     child: ListView.builder(
      //       itemCount: widget.menu.length,
      //       itemBuilder: (context, i) {
      //         return new ExpansionTile(
      //           title: new Text("Menu", style: TextStyle(color: Colors.white)),
      //           children: <Widget>[
      //             new Column(
      //               children: _buildExpandableContent(widget.menu[i]),
      //             ),
      //           ],
      //         );
      //       },
      //     )
      //     ),
    );
  }

  Widget listado() {
    return Container(
        width: 250,
        padding: padding,
        color: Color(0xffFE1EF8),
        child: ListView.builder(
          itemCount: widget.menu.length,
          itemBuilder: (context, i) {
            return new ExpansionTile(
              title: new Text("Menu", style: TextStyle(color: Colors.white)),
              children: <Widget>[
                new Column(
                  children: _buildExpandableContent(widget.menu[i]),
                ),
              ],
            );
          },
        ));
  }

  Widget buildMenuItem({String text, IconData icon, int indice}) {
    final color = Colors.white;
    final hoverColor = Color(0xffAF00FB);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontFamily: 'Gotic')),
      hoverColor: hoverColor,
      onTap: () {
        switch (indice) {
          case 1:
            {}
            break;
          case 2:
            {}
            break;
          case 3:
            {
              UserService userService = new UserService();
              userService
                  .razonSocial(widget.token)
                  .then((peticionRazonSocial) => {
                        if (peticionRazonSocial.error == false)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonasPage(
                                          token: widget.token,
                                          email: widget.email,
                                          nickname: widget.nickname,
                                          listadoRazon:
                                              peticionRazonSocial.listado,
                                        )))
                          }
                        else
                          {print('Error en boton menu Conteo Personas')}
                      });
            }
            break;
          case 4:
            {
              UserService userService = new UserService();
              userService
                  .razonSocial(widget.token)
                  .then((peticionRazonSocial) => {
                        if (peticionRazonSocial.error == false)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ParqueosPage(
                                          token: widget.token,
                                          email: widget.email,
                                          nickname: widget.nickname,
                                          listadoRazon:
                                              peticionRazonSocial.listado,
                                        )))
                          }
                        else
                          {print('Error en boton menu Conteo Parqueos')}
                      });
            }
            break;
          case 5:
            {
              UserService userService = new UserService();
              userService
                  .razonSocial(widget.token)
                  .then((peticionRazonSocial) => {
                        if (peticionRazonSocial.error == false)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReportePersonasAnual(
                                          token: widget.token,
                                          email: widget.email,
                                          nickname: widget.nickname,
                                          listadoRazon:
                                              peticionRazonSocial.listado,
                                        )))
                          }
                        else
                          {print('Error en boton menu Conteo Parqueos')}
                      });
            }
            break;
          case 6:
            {
              UserService userService = new UserService();
              userService
                  .razonSocial(widget.token)
                  .then((peticionRazonSocial) => {
                        if (peticionRazonSocial.error == false)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReportePersonasDia(
                                          token: widget.token,
                                          email: widget.email,
                                          nickname: widget.nickname,
                                          listadoRazon:
                                              peticionRazonSocial.listado,
                                        )))
                          }
                        else
                          {print('Error en boton menu Conteo Parqueos')}
                      });
            }
            break;
          case 7:
            {
              UserService userService = new UserService();
              userService
                  .razonSocial(widget.token)
                  .then((peticionRazonSocial) => {
                        if (peticionRazonSocial.error == false)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReportePersonaAnualMes(
                                          token: widget.token,
                                          email: widget.email,
                                          nickname: widget.nickname,
                                          listadoRazon:
                                              peticionRazonSocial.listado,
                                        )))
                          }
                        else
                          {print('Error en boton menu Conteo Parqueos')}
                      });
            }
            break;
          case 8:
            {
              UserService userService = new UserService();
              userService
                  .razonSocial(widget.token)
                  .then((peticionRazonSocial) => {
                        if (peticionRazonSocial.error == false)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        reportePersonasMesesCincoAnual(
                                          token: widget.token,
                                          email: widget.email,
                                          nickname: widget.nickname,
                                          listadoRazon:
                                              peticionRazonSocial.listado,
                                        )))
                          }
                        else
                          {print('Error en boton menu Conteo Parqueos')}
                      });
            }
            break;
          case 9:
            {
              UserService userService = new UserService();
              userService
                  .razonSocial(widget.token)
                  .then((peticionRazonSocial) => {
                        if (peticionRazonSocial.error == false)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReportePersonaAnioMesHora(
                                          token: widget.token,
                                          email: widget.email,
                                          nickname: widget.nickname,
                                          listadoRazon:
                                              peticionRazonSocial.listado,
                                        )))
                          }
                        else
                          {print('Error en boton menu Conteo Parqueos')}
                      });
            }
            break;
          case 10:
            {
              UserService userService = new UserService();
              userService
                  .razonSocial(widget.token)
                  .then((peticionRazonSocial) => {
                        if (peticionRazonSocial.error == false)
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReportePersonaDiaSemana(
                                          token: widget.token,
                                          email: widget.email,
                                          nickname: widget.nickname,
                                          listadoRazon:
                                              peticionRazonSocial.listado,
                                        )))
                          }
                        else
                          {print('Error en boton menu Conteo Parqueos')}
                      });
            }
            break;
        }
      },
    );
  }

  Widget logoutApp({String text,IconData icon,}) {
    // final color = Colors.white;
    final hoverColor = Color(0xffAF00FB);

    return ListTile(
      leading: Icon(icon),
      title: Text(text, style: TextStyle(color: Colors.white)),
      hoverColor: hoverColor,
      onTap: () {
        UserService userService = new UserService();
        userService.logout(widget.token).then((usuarioFuera) => {
              if (usuarioFuera.error == false)
                {Navigator.of(context).pushNamed('/login')}
              else
                {throw Exception('Hubo un error al deslogearse')}
            });
        //Navigator.of(context).pushNamed('/login');
      },
    );
  }

  _buildExpandableContent(Menu menu) {
    List<Widget> fila = [];
    IconData figura = IconData(0xe2ec, fontFamily: 'MaterialIcons');
                    
    for (Listado content in menu.listado){
      if(content.logo == "people"){
        figura = IconData(0xe486, fontFamily: 'MaterialIcons');
      }else if(content.logo == "lock"){
        figura = IconData(0xe3ae, fontFamily: 'MaterialIcons');
      }else if(content.logo == ""){
        figura = IconData(0xe3ae, fontFamily: 'MaterialIcons');
      }else {
        figura = IconData(0xe46e, fontFamily: 'MaterialIcons');
      }
      fila.add(
        new ListTile(
          title: new Text(
            content.pagina,
            style: new TextStyle(fontSize: 15.0),
          ),

          leading: new Icon(figura),
          onTap: () {
            UserService userService = new UserService();
            userService.razonSocial(widget.token).then((razonSocialEncontrada) =>{
              if (razonSocialEncontrada.error == true){
                print("Hubo un error en la peticion de razon social")
              }else{

                if(content.url == "/usuario"){
                  print("Aún no existe página")
                }else if (content.url == "/seguridad/permisos"){
                  print("Aún no existe página")
                }else if (content.url == "/ocupacionPersonas"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PersonasPage(
                    token: widget.token,
                    email: widget.email,
                    nickname: widget.nickname,
                    listadoRazon: razonSocialEncontrada.listado,
                    menu: widget.menu,
                  )))
                }else if (content.url == "/ocupacionParqueos"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ParqueosPage(
                    token: widget.token,
                    email: widget.email,
                    nickname: widget.nickname,
                    listadoRazon: razonSocialEncontrada.listado,
                    menu: widget.menu,
                  )))

                }else if (content.url == "/reportePersonasAnual"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportePersonasAnual(
                    token: widget.token,
                    email: widget.email,
                    nickname: widget.nickname,
                    listadoRazon: razonSocialEncontrada.listado,
                    menu: widget.menu,
                  )))
                }else if (content.url == "/reportePersonasMensual"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportePersonaAnualMes(
                    token: widget.token,
                    email: widget.email,
                    nickname: widget.nickname,
                    listadoRazon: razonSocialEncontrada.listado,
                    menu: widget.menu,
                  )))
                }else if (content.url == "/reporteComparativoMensual"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => reportePersonasMesesCincoAnual(
                    token: widget.token,
                    email: widget.email,
                    nickname: widget.nickname,
                    listadoRazon: razonSocialEncontrada.listado,
                    menu: widget.menu,
                  )))
                }else if (content.url == "/reporteComparativoAnualMensual"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportePersonaAnualMes(
                    token: widget.token,
                    email: widget.email,
                    nickname: widget.nickname,
                    listadoRazon: razonSocialEncontrada.listado,
                    menu: widget.menu,
                  )))
                }else if (content.url == "/reporteComparativoAnualMensualDiario"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReportePersonaAnioMesHora(
                    token: widget.token,
                    email: widget.email,
                    nickname: widget.nickname,
                    listadoRazon: razonSocialEncontrada.listado,
                    menu: widget.menu,
                  )))
                }


              }
            });
          },
        ),
      );
    }
      

    return fila;
  }
}
