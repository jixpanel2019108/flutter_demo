//@dart = 2.9

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.Dart';
import 'package:flutter_demo/services/userService.dart';
import 'package:flutter_demo/services/reportService.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_demo/models/reportePersonasMesesCincoAnualModel.dart' as reporte;
import 'package:flutter_demo/models/catCentroComercialModel.dart' as comercial;
import 'package:flutter_demo/models/catRazonSocialModel.dart' as razon;
import 'package:flutter_demo/models/conteoPersonasModel.dart' as personas;
import 'package:flutter_demo/pages/menu.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class reportePersonasMesesCincoAnual extends StatefulWidget {
  final String token;
  final String nickname;
  final String email;
  final List<razon.Listado> listadoRazon;
  final List<charts.Series> grafica;
  final bool animacion;
  

  const reportePersonasMesesCincoAnual({ Key key, this.token, this.nickname, this.email, this.listadoRazon, this.animacion, this.grafica}) :  super(key: key);

  @override
  _reportePersonasMesesCincoAnual createState() => _reportePersonasMesesCincoAnual();
}

class _reportePersonasMesesCincoAnual extends State<reportePersonasMesesCincoAnual> {

  String nombreRazon;
  String nombreInmueble;
  String idRazon;
  String alertaVerde;
  String alertaOcupacion;
  String alertaRoja;
  String ocupacionMaximaPersonas;
  String ocupacionMaximaParqueos;
  String idInmueble;
  String value;
  String alertaAmarilla;
  List<comercial.Listado> listadoComercial;
  List<personas.Listado1> listadoPersonas;
  List<reporte.Listado> listadoGrafica = [];
  List listaDropdownInmueble = [];
  List listadoTabla = [];
  double cantidadColumnas = 0;

  String fini;
  String ffin;
  int totalYear;

  final mesController = TextEditingController();
  final anioIniController = TextEditingController();
  final anioFinController = TextEditingController();
  String mes = "";
  String anioIni;
  String anioFin;
  bool dropdown1Bool = false;
  bool dropdown2Bool = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff313131),
      appBar: AppBar(
        title: Image.asset('assets/logo_shoppertrace_blanco.png', width: 200, ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: MenuPage(token: widget.token, nickname: widget.nickname,email:widget.email,),
      body: SingleChildScrollView(
        child: Container( 
          child: Column(
            children: [
              cuerpo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget cuerpo(context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text( 
            'Reporte Personas todos los meses por años',
            style: TextStyle(color: Color(0xff890e8a), fontSize: 45,),
          ),
          const SizedBox(height: 25.0,),
          Text('Usuario: '+ widget.nickname, style: TextStyle(fontWeight: FontWeight.bold ,color: Color(0xffe1c0ea)),),
          const SizedBox(height: 25.0,),
          Text('Ultima Actualización:', style: TextStyle(color: Color(0xffe1c0ea),fontWeight: FontWeight.bold)),
          const SizedBox(height: 25.0,),
          Text('Ocupación Máxima Autorizada:', style: TextStyle(color: Color(0xffe1c0ea),fontWeight: FontWeight.bold)),
          const SizedBox(height: 25,),
          union1(),
          const SizedBox(height: 15,),
          union2(),
          const SizedBox(height: 15,),
          anioInicial(),
          const SizedBox(height: 15,),
          anioFinal(),
          const SizedBox(height: 25,),
          botonConsulta(),
          const SizedBox(height: 25,),
          columnChart1(),
          const SizedBox(height: 15,),
          Center(child:Text("Datos", style: TextStyle(color: Colors.white,fontFamily: 'Gotic', fontWeight: FontWeight.bold, fontSize: 14),)),
          tabla(),
          
        ],
      ),
    );
  }

  
  Widget union1(){
    return Container(
      child: Row(
        children: <Widget> [
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

  Widget anioInicial() {
    return Container(
      margin: EdgeInsets.only(right: 250),
      child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: anioIniController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Año Inicial',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),
                      labelStyle: TextStyle(
                        color: Color(0xffe1c0ea)
                      ),
                    ),
                  ),
                  
                ],
              ),
            );
          }
      ),
    );
  }

  Widget anioFinal() {
    return Container(
      margin: EdgeInsets.only(right: 250),
      child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: anioFinController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Año Final',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),
                      labelStyle: TextStyle(
                        color: Color(0xffe1c0ea)
                      ),
                    ),
                  ),
                  
                ],
              ),
            );
          }
      ),
    );
  }

  Widget dropdown1(){
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff890e8a), width: 2),
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
        value: nombreRazon,
        onChanged: (newValue){
          setState(() {
            dropdown2();
            nombreRazon = newValue;
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
                  //this.listadoComercial = this.listadoComercial,
                  this.listaDropdownInmueble = listadoComercial != null? listadoComercial : <comercial.Listado>[],
                  this.dropdown1Bool = true,
                  dropdown2(),
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
        border: Border.all(color: Color(0xff890e8a), width: 2),
        borderRadius: BorderRadius.circular(10)
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
        value: nombreInmueble,
        onChanged: (newValue){
          setState(() {
            dropdown2();
            nombreInmueble = newValue;
          });
        },
        items: listaDropdownInmueble.map((valueItem){
          return DropdownMenuItem(
            value: '${valueItem.value}',
            child: Text('${valueItem.value}', style: TextStyle(color: Color(0xffe1c0ea)),),
            onTap: (){
              this.alertaVerde = valueItem.alertaVerde;
              this.alertaOcupacion = valueItem.alertaOcupacion;
              this.alertaRoja = valueItem.alertaRoja;
              this.ocupacionMaximaPersonas = valueItem.ocupacionMaximaPersonas;
              this.ocupacionMaximaParqueos = valueItem.ocupacionMaximaParqueos;
              this.idInmueble = valueItem.id;
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
        child: 
        Text('Consultar',
          style: TextStyle(color: Colors.white),
        )
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5) 
      ),
      color: Color(0xff890e8a),
      onPressed: (){
        mes = mesController.text;
        anioIni = anioIniController.text ?? "";
        anioFin = anioFinController.text ?? "";
        listadoGrafica = [];
        

        if (this.dropdown1Bool == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content:  Text("Seleccione una Razón"),
                    duration: const Duration(seconds: 1)));
        }else if(this.dropdown2Bool == false){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content:  Text("Seleccione un Inmueble"),
                    duration: const Duration(seconds: 1)));
        }else if (anioIni == ""){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content:  Text("Seleccione un año inicial"),
                    duration: const Duration(seconds: 1)));
        }else if(anioFin == ""){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content:  Text("Seleccione un año final"),
                    duration: const Duration(seconds: 1)));
        }else if (int.parse(anioFin) - int.parse(anioIni) + 1>5){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content:  Text("Solo puede seleccionar un rango de 5 años"),
                    duration: const Duration(seconds: 1)));

        } else if(int.parse(anioIni) > int.parse(anioFin)){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content:  Text("El año inicial no puede ser mayor al año final"),
                    duration: const Duration(seconds: 1)));

        } else{
          totalYear = int.parse(anioFin) - int.parse(anioIni) + 1;
          ReportService reportService = new ReportService();
          reportService.reportePersonasMesesCincoAnual(widget.token, widget.nickname, this.idInmueble, anioIni, anioFin)
            .then((reporteObtenido) => {
              cantidadColumnas = reporteObtenido.listado.length.toDouble(),

              reporteObtenido.listado.forEach((element) {
                  int count;
                  count = int.parse(anioFin) - int.parse(element.year);
                  reporte.Listado listado = new reporte.Listado();

                  switch (count) {
                    case 0:
                      listado.color = Colors.red[400];
                      break;
                    case 1:
                        listado.color = Colors.blue[400];
                      break;
                    case 2:
                        listado.color = Colors.green[400];
                      break;
                    case 3:
                        listado.color = Colors.yellow;
                      break;
                    case 4:
                        listado.color = Colors.teal;
                      break;
                    case 5:
                        listado.color = Colors.purple;
                      break;
                    case 6:
                        listado.color = Colors.red[400];
                      break;
                    case 7:
                        listado.color = Colors.blue[400];
                      break;
                    case 8:
                        listado.color = Colors.green[400];
                      break;
                    case 9:
                        listado.color = Colors.yellow;
                      break;
                    case 10:
                        listado.color = Colors.teal;
                      break;
                    default:
                        listado.color = Colors.pink[400];
              }
              
              listado.entradas = element.entradas;
              listado.mes = element.mes;
              listado.year = element.year;
              listadoGrafica.add(listado);

              setState(() {
                columnChart1();
                tabla();
              });

            })
        });

        }
      },
    );
  }

  Widget tabla(){
    final columns = ['Año','Mes','Conteo'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 120,),
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
          rows: getRows(listadoGrafica) ?? '',
          
          headingRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if(states.contains(MaterialState.selected))
              return Theme.of(context).colorScheme.primary.withOpacity(0.08);
            return null;
          }),
        )
      ),
    );
  }

  Widget columnChart1(){

    return Container(
    height: 25*cantidadColumnas, // height of the Container widget
     // width of the Container widget
    child: Center(
      child: SfCartesianChart(
          title: ChartTitle(text:"Gráfica mes " + this.mes , textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gotic',
                    fontWeight: FontWeight.w400
                  )),
          // legend: Legend(isVisible: true),
          series: <ChartSeries>[
            BarSeries<reporte.Listado, String>(dataSource: listadoGrafica, 
                      xValueMapper: (reporte.Listado sales, _) => sales.mes +"/"+ sales.year,
                      yValueMapper: (reporte.Listado sales, __) => int.parse(sales.entradas),
                      pointColorMapper: (reporte.Listado data, _) => data.color,
                      dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    // Positioning the data label
                                    labelAlignment: ChartDataLabelAlignment.top
                    )
                      )
                      
          ],
          primaryXAxis: CategoryAxis(
                            // Y axis labels will be rendered with currency format
                            // labelPlacement: LabelPlacement.onTicks
                            arrangeByIndex: true
                            
                        ),
          
        )
      )
    );
    
  }


  List <DataColumn> getColumns(List<String> columns) => columns.map((String column) => DataColumn(
        label: Text(column, style: TextStyle(color: Colors.white),),
      )).toList();

  List <DataCell> getCells(List<dynamic> cells) => cells.map((data) => DataCell(Text('$data' ?? 'nada'))).toList();
 
  List <DataRow> getRows (List<reporte.Listado> row,) => row.map((reporte.Listado hola,) {
    final cells = [hola.year, hola.mes, hola.entradas];
    return DataRow(cells: getCells(cells));
  }).toList();
 
  
}