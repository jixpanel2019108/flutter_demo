//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catCentroComercialModel.dart';
import 'package:flutter_demo/models/catRazonSocialModel.dart' as razon;
import 'package:intl/intl.dart';
import 'package:flutter_demo/services/userService.dart';
import 'package:flutter_demo/models/listMenuAppModel.dart';
import 'package:flutter_demo/pages/menu.dart';

class PersonasPage extends StatefulWidget{
  final String token;
  final String nickname;
  final String email;
  final List<razon.Listado> listadoRazon;

  const PersonasPage({ Key key, this.token, this.nickname, this.email, this.listadoRazon}) : super(key: key);
  @override
  _PersonasPage createState() => _PersonasPage();
}

class _PersonasPage extends State<PersonasPage> {
  DateTime _dateTime ;
  var formato = new DateFormat('yyyy-MM-dd');
  String valueChoose;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      drawer: MenuPage(token: widget.token, nickname: widget.nickname,email:widget.email,),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              cuerpo()
            ],
          ),
        ),
      ),
    );
  }

  Widget cuerpo(){
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 40,),
          datosCabecera(context),
          //dropDown1()
        ],
      ),
    );
  }

  Widget datosCabecera(context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Conteos',
            style: TextStyle(color: Color(0xffAF00FB), fontSize: 45),
          ),
          const SizedBox(height: 15.0,),
          Text('Usuario: '+ '$widget.nickname'),
          const SizedBox(height: 25.0,),
          Text('Ultima Actualización:'),
          const SizedBox(height: 25.0,),
          Text('Ocupación Máxima Autorizada:'),
          const SizedBox(height: 25,),
          union1(),
          const SizedBox(height: 15,),
          union2(),
          const SizedBox(height: 15,),
          unionFe(),
          const SizedBox(height: 25,),
          botonConsulta()
        ],
      ),
    );
  }

  Widget botonConsulta(){
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
        child: 
        Text('Consultar',
          style: TextStyle(color: Colors.white),
        )
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20) 
      ),
      color: Color(0xffFE1EF8),
      onPressed: (){

      },
    );
  }

  Widget unionFe(){
    return Container(
      child: Row(
        children: <Widget>[
          Text(_dateTime == null ? 'No has seleccionado fecha' : _dateTime.toString(),),
          SizedBox(height: 15, width: 15,),
          RaisedButton(
            child: Text('Selecciona una fecha', style: TextStyle(color: Colors.white),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            color: Color(0xffFE1EF8),
            onPressed: (){
              showDatePicker(
                context: context,
                initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                firstDate: DateTime(2001),
                lastDate: DateTime.now()
              ).then((date){
                setState(() {
                  _dateTime = date;
                });
              });
            } 
          )
        ],
      ),
    );
  }

  Widget union1(){
    return Container(
      child: Row(
        children: [
          Text('Seleccione una Razon:', style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 15, width: 15,),
          dropdown1(),
          SizedBox(width: 15,),
        ],
      ),
    );
  
  }

  Widget union2(){
    return Container(
      child: Row(
        children: [
          Text('Seleccione un Inmueble:',  style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 15, width: 15,),
          dropdown2()
        ],
      ),
    );
  
  }

  Widget dropdown1(){
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFE1EF8), width: 2),
        borderRadius: BorderRadius.circular(20)
      ),
      child: DropdownButton(
        hint: Text('Selecciona una Razón', style: TextStyle(fontSize: 15, color: Colors.black),),
        dropdownColor: Colors.grey,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        underline: SizedBox(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 15
        ),
        value: valueChoose,
        onChanged: (newValue){
          setState(() {
            valueChoose = newValue;
          });
        },
        
        
        items: widget.listadoRazon.map((listado){
          print(widget.listadoRazon);
          return DropdownMenuItem(
            value: '${listado.value}',
            child: Text('${listado.value}'),
            onTap: (){
              
            },
          );
        }).toList()
      ), 
    );
  }

    Widget dropdown2(){
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffFE1EF8), width: 2),
        borderRadius: BorderRadius.circular(20)
      ),
      child: DropdownButton(
        hint: Text('Selecciona un Inmueble', style: TextStyle(fontSize: 15, color: Colors.black),),
        dropdownColor: Colors.grey,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        underline: SizedBox(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15
        ),
        value: valueChoose,
        onChanged: (newValue){
          setState(() {
            valueChoose = newValue;
          });
        },
        items: widget.listadoRazon.map((valueItem){
          return DropdownMenuItem(
            value: valueItem,
            child: Text('$valueItem'),
            onTap: (){

            },
          );
        }).toList()
      ), 
    );
  }

  Widget tabla(){
    final columnas = ['Nombre1', 'Nombre2', 'YoQueSe'];
    return DataTable(
      //columns: 
      //rows: rows
    );
  }




}



