//@dart = 2.9

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/services/userService.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_demo/models/reportePersonasAnualModel.dart' as reporte;
import 'package:flutter_demo/models/catCentroComercialModel.dart' as comercial;
import 'package:flutter_demo/models/catRazonSocialModel.dart' as razon;
import 'package:flutter_demo/models/conteoPersonasModel.dart' as personas;
import 'package:flutter_demo/pages/menu.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ReportePersonasAnual extends StatefulWidget {
  final String token;
  final String nickname;
  final String email;
  final List<razon.Listado> listadoRazon;
  final List<charts.Series> grafica;
  final bool animacion;

  const ReportePersonasAnual({ Key key, this.token, this.nickname, this.email, this.listadoRazon, this.animacion, this.grafica}) :  super(key: key);

  @override
  _ReportePersonasAnualState createState() => _ReportePersonasAnualState();
}

class _ReportePersonasAnualState extends State<ReportePersonasAnual> {

  DateTime _dateTime;
  String nombreRazon;
  String nombreInmueble;
  String idRazon;
  String alertaVerde;
  String alertaOcupacion;
  String alertaRoja;
  String ocupacionMaximaPersonas;
  String ocupacionMaximaParqueos;
  String id;
  String value;
  String alertaAmarilla;
  List<comercial.Listado> listadoComercial;
  List<personas.Listado1> listadoPersonas;
  List<reporte.Listado> listadoGrafica = [];
  List listaDropdownInmueble = [];
  List listadoTabla = [];

  String fini;
  String ffin;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            'Conteo Personas',
            style: TextStyle(color: Color(0xffAF00FB), fontSize: 45,),
          ),
          const SizedBox(height: 15.0,),
          Text('Usuario: '+ widget.nickname),
          const SizedBox(height: 25.0,),
          Text('Ultima Actualización:'),
          const SizedBox(height: 25.0,),
          Text('Ocupación Máxima Autorizada:'),
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
          tabla(),
          const SizedBox(height: 25,),
          columnChart()
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
        borderRadius: BorderRadius.circular(20) 
      ),
      color: Color(0xffFE1EF8),
      onPressed: (){
        listadoGrafica = [];
        UserService userService = new UserService();
        userService.reportePersonasAnual(widget.token, this.id, "2018", "2021").then((reporteObtenido) => {
          if(reporteObtenido.error == true){
            print('Error al hacer la consula en page reportePersonasAnual')
          }else{
            reporteObtenido.listado.forEach((element) {
              reporte.Listado listado = new reporte.Listado();
              listado.conteo = element.conteo;
              listado.fecha = element.fecha;
              listadoGrafica.add(listado);

              setState(() {
                columnChart();
                tabla();
              });
            })
          }
        });
      },
    );
  }

  Widget unionFe(){
    return Container(
      child: Row(
        children: <Widget>[
          Text( _dateTime == null ? 'No has seleccionado fecha' : _dateTime.toString(),),
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
        children: <Widget> [
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

   Widget initialDate() {
    return Container(
      child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(3), child: TextFormField(
                  keyboardType: TextInputType.number,
              decoration: InputDecoration(
              hoverColor: Colors.black,
              fillColor: Colors.black,
              focusColor: Colors.black,
              labelText: 'Fecha Inicial',
              hintStyle: TextStyle(
                color: Colors.black
              ),
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
    
            ),
            ),)
                ],
    
            ),
              );
          }
      ),
    );
  }

  Widget lastDate() {
    return Container(
      child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0), child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Fecha Final',
                      //alignLabelWithHint: ,
                      hintStyle: TextStyle(
                        color: Colors.black
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),)
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
            child: Text('${listado.value}'),
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
        value: nombreInmueble,
        onChanged: (newValue){
          setState(() {
            nombreInmueble = newValue;
          });
        },
        items: listaDropdownInmueble.map((valueItem){
          return DropdownMenuItem(
            value: '${valueItem.value}',
            child: Text('${valueItem.value}'),
            onTap: (){
              this.alertaVerde = valueItem.alertaVerde;
              this.alertaOcupacion = valueItem.alertaOcupacion;
              this.alertaRoja = valueItem.alertaRoja;
              this.ocupacionMaximaPersonas = valueItem.ocupacionMaximaPersonas;
              this.ocupacionMaximaParqueos = valueItem.ocupacionMaximaParqueos;
              this.id = valueItem.id;
              this.value = valueItem.value;
              this.alertaAmarilla = valueItem.alertaAmarilla;
            },
          );
        }).toList()
      ), 
    );
  }

  Widget tabla(){
    final columns = ['Fecha','Suma'];
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
            border: Border.all(color: Colors.black, width: 0.5),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
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

    final cells = [hola.fecha, hola.conteo];
    return DataRow(cells: getCells(cells));
  }).toList();


  Widget grafica(){

    List<charts.Series<reporte.Listado,String>> series = [
      charts.Series(
        id: "Financial",
        data: listadoGrafica,
        domainFn: (reporte.Listado series, _) => series.fecha,
        measureFn: (reporte.Listado series, _) => int.parse(series.conteo),
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault),
      
    ];
    
  

  }

 
  List<charts.Series<reporte.Listado, String>> _createSampleData() {

    return [new charts.Series<reporte.Listado, String>(
                  id: 'Reporte',
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                  domainFn: (reporte.Listado listado, _) => listado.fecha,
                  measureFn: (reporte.Listado listado, _) => int.parse(listado.conteo),
                  data: this.listadoGrafica,
                )];

  }
  
  Widget columnChart(){
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
                            // Y axis labels will be rendered with currency format
                            // labelPlacement: LabelPlacement.onTicks
                            arrangeByIndex: true
                        ),
                        series: <ChartSeries>[
                            // Renders column chart
                            
                            ColumnSeries<reporte.Listado, int>(
                                dataSource: listadoGrafica,
                                xValueMapper: (reporte.Listado sales, _) => int.parse(sales.fecha),
                                yValueMapper: (reporte.Listado sales, __) => int.parse(sales.conteo),
                                color: Theme.of(context).primaryColor,
                                dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    // Positioning the data label
                                    labelAlignment: ChartDataLabelAlignment.top
                                )
                            )
                        ]
                    );
  }

  
  
}
