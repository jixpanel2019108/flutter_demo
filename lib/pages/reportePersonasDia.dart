//@dart = 2.9

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.Dart';
import 'package:flutter_demo/services/userService.dart';
import 'package:flutter_demo/services/reportService.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_demo/models/reportePersonaDiaModel.dart' as reporte;
import 'package:flutter_demo/models/catCentroComercialModel.dart' as comercial;
import 'package:flutter_demo/models/catRazonSocialModel.dart' as razon;
import 'package:flutter_demo/models/conteoPersonasModel.dart' as personas;
import 'package:flutter_demo/pages/menu.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ReportePersonasDia extends StatefulWidget {
  final String token;
  final String nickname;
  final String email;
  final List<razon.Listado> listadoRazon;
  final List<charts.Series> grafica;
  final bool animacion;
  

  const ReportePersonasDia({ Key key, this.token, this.nickname, this.email, this.listadoRazon, this.animacion, this.grafica}) :  super(key: key);

  @override
  _ReportePersonasDia createState() => _ReportePersonasDia();
}

class _ReportePersonasDia extends State<ReportePersonasDia> {

  DateTime _dateTime;
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

  final mesController = TextEditingController();
  final anioController = TextEditingController();
  String mes;
  String anio;
  
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
            'Reporte Personas Anual',
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
          initialDate(),
          const SizedBox(height: 15,),
          lastDate(),
          const SizedBox(height: 25,),
          botonConsulta(),
          const SizedBox(height: 25,),
          columnChart1(),
          tabla(),
          
          // charts.BarChart(
          //   _createSampleData(),
          //   animate: true,
          // )
          //tabla()
        ],
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
        borderRadius: BorderRadius.circular(5) 
      ),
      color: Color(0xff890e8a),
      onPressed: (){
        mes = mesController.text;
        anio = anioController.text;
        listadoGrafica = [];
        ReportService reportService = new ReportService();

        reportService.reportePersonaDia(widget.token, this.idInmueble, mes, anio).then((reporteObtenido) => {
          
          cantidadColumnas = reporteObtenido.listado.length.toDouble(),
          reporteObtenido.listado.forEach((element) {
              print(element);
              reporte.Listado listado = new reporte.Listado();
              listado.entradas = element.entradas;
              listado.fecha = element.fecha;
              listadoGrafica.add(listado);

              setState(() {
                columnChart();
                tabla();
              });
            })
            
            
            /*if(reporteObtenido.error == true){
            print('Error al hacer la consulta en page reportePersonasDia')
          }else{
            reporteObtenido.listado.forEach((element) {
              print(element);
              reporte.Listado listado = new reporte.Listado();
              listado.entradas = element.entradas;
              listado.fecha = element.fecha;
              listadoGrafica.add(listado);

              setState(() {
                columnChart();
                tabla();
              });
            })
          }*/
        });
      },
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

  Widget initialDate() {
    return Container(
      margin: EdgeInsets.only(right: 250),
      child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: mesController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                    ],
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Mes',
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

  Widget lastDate() {
    return Container(
      margin: EdgeInsets.only(right: 250),
      child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              //padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: anioController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Año',
                      hintStyle: TextStyle(
                        color: Color(0xffe1c0ea)
                      ),
                      labelStyle: TextStyle(
                        color: Color(0xffe1c0ea)
                      ),
                    ),
                  ),
                ]
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
            nombreRazon = newValue;
            dropdown2();
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
                  this.listaDropdownInmueble = listadoComercial != null? listadoComercial : <comercial.Listado>[]
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
            },
          );
        }).toList()
      ), 
    );
  }

  Widget tabla(){
    final columns = ['Fecha','Conteo'];
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

  List <DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
        label: Text(column, style: TextStyle(color: Colors.white),),
      ))

    .toList();
 
  List <DataCell> getCells(List<dynamic> cells) => cells.map((data) => DataCell(Text('$data' ?? 'nada'))).toList();
 
  List <DataRow> getRows (List<reporte.Listado> row,) => row.map((reporte.Listado hola,) {

    final cells = [hola.fecha, hola.entradas];
    return DataRow(cells: getCells(cells));
  }).toList();


  Widget grafica(){

    List<charts.Series<reporte.Listado,String>> series = [
      charts.Series(
        id: "Financial",
        data: listadoGrafica,
        domainFn: (reporte.Listado series, _) => series.fecha.toString(),
        measureFn: (reporte.Listado series, _) => int.parse(series.entradas),
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault),
      
    ];
    
  

  }

 
  List<charts.Series<reporte.Listado, String>> _createSampleData() {

    return [new charts.Series<reporte.Listado, String>(
                  id: 'Reporte',
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                  domainFn: (reporte.Listado listado, _) => listado.fecha.toString(),
                  measureFn: (reporte.Listado listado, _) => int.parse(listado.entradas),
                  data: this.listadoGrafica,
                )];

  }
  
  Widget columnChart(){
    // final DateFormat formatter = DateFormat('yyyy-MM-dd');
    // DateTime fecha = DateTime.now();
    // final String fechaString = formatter.format(fecha);
    return SafeArea(
      child: SfCartesianChart(
        // margin: EdgeInsets.all(0),
        title: ChartTitle(text: "Gráfica"),
        // legend: Legend(isVisible: true),
        // tooltipBehavior: _tooltipBehavior,
        primaryXAxis: CategoryAxis(
                              // Y axis labels will be rendered with currency format
                              // labelPlacement: LabelPlacement.onTicks
                              arrangeByIndex: true
                          ),
                          
                          series: <ChartSeries>[
                              // Renders column chart
                              
                              LineSeries<reporte.Listado, String>(
                                  dataSource: listadoGrafica,
                                  xValueMapper: (reporte.Listado sales, _) => sales.fecha,
                                  yValueMapper: (reporte.Listado sales, __) => int.parse(sales.entradas),
                                  color: Theme.of(context).primaryColor,
                                  
                                  dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    // Positioning the data label
                                    labelAlignment: ChartDataLabelAlignment.middle
                                )
                              )
                          ]
                      ),
    );
  }

  
  Widget columnChart1(){
    return Container(
    height: cantidadColumnas*30, // height of the Container widget
     // width of the Container widget
    child: Center(
      child: SfCartesianChart(
          title: ChartTitle(text:"Gráfica"),
          // legend: Legend(isVisible: true),
          series: <ChartSeries>[
            BarSeries<reporte.Listado, String>(dataSource: listadoGrafica, 
                      xValueMapper: (reporte.Listado sales, _) => sales.fecha,
                      yValueMapper: (reporte.Listado sales, __) => int.parse(sales.entradas),
                      color: Theme.of(context).primaryColor,
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
}
