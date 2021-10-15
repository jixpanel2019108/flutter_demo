//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catCentroComercialModel.dart' as comercial;
import 'package:flutter_demo/models/catRazonSocialModel.dart' as razon;
import 'package:flutter_demo/models/conteoPersonasModel.dart' as personas;
import 'package:flutter_demo/services/userService.dart';
import 'package:flutter_demo/pages/menu.dart';

class ParqueosPage extends StatefulWidget{
  final String token;
  final String nickname;
  final String email;
  final List<razon.Listado> listadoRazon;

  const ParqueosPage({ Key key, this.token, this.nickname, this.email, this.listadoRazon}) :  super(key: key);
  @override
  _ParqueosPage createState() => _ParqueosPage();
}

class _ParqueosPage extends State<ParqueosPage> {
  DateTime _dateTime;
  String fechaString;
  DateTime pruebafecha = DateTime.now();
  String idRazon;
  String valueRazon;
  String valueInmueble;
  String razon;
  String prueba = 'hola';
  List<comercial.Listado> listadoComercial;
  List<personas.Listado1> listadoTabla = [];
  List pruebalista = [];
  String alertaVerde;
  String alertaOcupacion;
  String alertaRoja;
  String ocupacionMaximaPersonas;
  String ocupacionMaximaParqueos;
  String id;
  String value;
  String alertaAmarilla;
  bool dropdown1Bool = false;
  bool dropdown2Bool = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff313131),
      appBar: AppBar(
        title: Image.asset('assets/logo_shoppertrace_blanco.png', width: 200,),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
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
            'Conteo Parqueos',
            style: TextStyle(color: Color(0xff890e8a), fontSize: 45,),
          ),
          const SizedBox(height: 25.0,),
          Text('Usuario: '+ widget.nickname, style: TextStyle(fontWeight: FontWeight.bold ,color: Color(0xffe1c0ea)),),
          const SizedBox(height: 25.0,),
          Text('Ultima Actualización:', style: TextStyle(fontWeight: FontWeight.bold ,color: Color(0xffe1c0ea)),),
          const SizedBox(height: 25.0,),
          Text('Ocupación Máxima Autorizada:', style: TextStyle(fontWeight: FontWeight.bold ,color: Color(0xffe1c0ea)),),
          const SizedBox(height: 25,),
          union1(),
          const SizedBox(height: 15,),
          union2(),
          const SizedBox(height: 15,),
          unionFe(),
          const SizedBox(height: 25,),
          botonConsulta(),
          const SizedBox(height: 25,),
          tabla()
        ],
      ),
    );
  }

  Widget unionFe(){
    return Container(
      child: Row(
        children: <Widget>[
          Text( _dateTime == null ? 'No has seleccionado fecha' : 'La fecha es: ' + _dateTime.toString(), style: TextStyle(color: Color(0xffe1c0ea)),),
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
                lastDate: DateTime.now(),
                
              ).then((date){
                setState(() {
                  print(date);
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
          Text('Seleccione una Razon:', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffe1c0ea)),),
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
          Text('Seleccione un Inmueble:',  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffe1c0ea)),),
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
        hint: Text('Selecciona una Razón', style: TextStyle(fontSize: 15, color: Color(0xffe1c0ea)),),
        dropdownColor: Colors.grey,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        underline: SizedBox(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15
        ),
        value: valueRazon,
        onChanged: (newValue){
          setState(() {
            valueRazon = newValue;
          });
        },
        items: widget.listadoRazon.map((listado){
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
                  this.listadoComercial = centrosComerciales.listado,
                  this.listadoComercial = this.listadoComercial,
                  this.pruebalista = listadoComercial != null? listadoComercial : <comercial.Listado>[],
                  this.dropdown1Bool = true,
                  setState(() {
                    dropdown2();
                  })
                }
              });
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
        hint: Text('Selecciona un Inmueble', style: TextStyle(fontSize: 15, color: Color(0xffe1c0ea)),),
        dropdownColor: Colors.grey,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        underline: SizedBox(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15
        ),
        value: valueInmueble,
        onChanged: (newValue){
          setState(() {
            valueInmueble = newValue;
          });
        },
        items: pruebalista.map((valueItem){
          return DropdownMenuItem(
            value: '${valueItem.value}',
            child: Text('${valueItem.value}', style: TextStyle(color: Color(0xffe1c0ea)),),
            onTap: (){
              this.alertaVerde = valueItem.alertaVerde;
              this.alertaOcupacion = valueItem.alertaOcupacion;
              this.alertaRoja = valueItem.alertaRoja;
              this.ocupacionMaximaPersonas = valueItem.ocupacionMaximaPersonas;
              this.ocupacionMaximaParqueos = valueItem.ocupacionMaximaParqueos;
              this.id = valueItem.id;
              this.value = valueItem.value;
              this.alertaAmarilla = valueItem.alertaAmarilla;
              this.dropdown2Bool = true;
            },
          );
        }).toList()
      ), 
    );
  }

  Widget botonConsulta(){
    return RaisedButton(
      child: Center(
        //padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
        child: 
        Text('Consultar',
          style: TextStyle(color: Colors.white),
        )
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20) 
      ),
      color: Color(0xff890e8a),
      onPressed: (){
        UserService userService = new UserService();
        listadoTabla = [];

        if (this.dropdown1Bool == false){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content:  Text("Seleccione una Razón"),
                    duration: const Duration(seconds: 1)));
        }else if(this.dropdown2Bool == false){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content:  Text("Seleccione un Inmueble"),
                    duration: const Duration(seconds: 1)));
        }else {
          userService.conteoParqueos(widget.token, widget.nickname, _dateTime, idRazon, ocupacionMaximaParqueos, alertaOcupacion, this.id).then((conteo) => {
          if(conteo.error == true){
            print('Error al consultar sus resultados')
          }else{
            conteo.listado1.forEach((element) {
              personas.Listado1 lista = new personas.Listado1();
              lista.cc = element.cc;
              lista.entradas = element.entradas;
              lista.fecha = element.fecha;
              lista.hora = element.hora;
              lista.ocupacionInstantanea = element.ocupacionInstantanea;
              lista.ocupacionMaximaAutorizada = element.ocupacionMaximaAutorizada;
              lista.porcentajeOcupacion = element.porcentajeOcupacion;
              lista.salidas = element.salidas;
              lista.acumuladoSalidas = element.acumuladoSalidas;
              lista.alertaOcupacion = element.alertaOcupacion;
              lista.acumuladoEntradas = element.acumuladoEntradas;
              listadoTabla.add(lista);
            }),
            tabla(),
            setState(() { tabla();})
          }
        });
        }

        
      },
    );
  }
  
  Widget tabla(){
    final columns = ['CC','Fecha','Acumulado Salidas','Alerta Ocupación','Ocupacion Instantanea','Hora','Entradas', 'Ocupación Max.','Porcentaje Ocup.','Salidas', 'Acumulados Entradas'];
    print('listadoTabla');
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: DataTable(
          dataRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if(states.contains(MaterialState.selected))
              return Colors.grey;
            return null;
          }),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5)
          ),
          columns: getColumns(columns) ?? '', 
          dataTextStyle: TextStyle(color: Colors.white),
          rows: getRows(listadoTabla) ?? '',
          
          headingRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if(states.contains(MaterialState.selected))
              return Theme.of(context).colorScheme.primary.withOpacity(0.08);
            return null;
          }),
        )
      ),
    );
  }

  List <DataColumn> getColumns(List<String> columns) => columns.map((String column) => DataColumn(
        label: Text(column, style: TextStyle(color: Colors.white),),
      )).toList();


  List <DataCell> getCells(List<dynamic> cells) => cells.map((data) => DataCell(Text('$data' ?? 'nada'))).toList();

  List <DataRow> getRows (List<personas.Listado1> row,) => row.map((personas.Listado1 hola,) {

    final cells = [hola.cc, hola.fecha, hola.acumuladoSalidas, hola.alertaOcupacion, hola.ocupacionInstantanea, hola.hora, hola.entradas, hola.ocupacionMaximaAutorizada, hola.porcentajeOcupacion, hola.salidas, hola.acumuladoEntradas, ];
    return DataRow(cells: getCells(cells));
  }).toList();
  
  
}



