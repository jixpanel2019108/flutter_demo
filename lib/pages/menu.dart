//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/listMenuModel.dart';
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
            //buildMenuItem(),
            const SizedBox(height: 30),
            Divider(color: Colors.white70),
            const SizedBox(height: 24),
            buildMenuItem(
              text: 'Conteos',
              icon: Icons.people
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Conteos',
              icon: Icons.people
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Conteos',
              icon: Icons.exit_to_app
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text: 'Conteos',
              icon: Icons.people
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white70),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
  }) {
    final color = Colors.white;
    final hoverColor = Color(0xffAF00FB);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: () {},
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('/forgotPassword');
        break;
      case 1:
        Navigator.of(context).pushNamed('/forgotPassword');
        break;
    }
  }
}