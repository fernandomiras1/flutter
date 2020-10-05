import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: [_titulos(), _botonesRedondeados()],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
      // Esta es la forma basica de crear los botones de abajo
      // bottomNavigationBar: BottomNavigationBar(
      //     fixedColor: Colors.pink,
      //     items: <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //           // lo dejamos sin texto, pero es obli. titulo
      //           title: Container(),
      //           icon: Icon(Icons.calendar_today)),
      //       BottomNavigationBarItem(
      //           title: Container(), icon: Icon(Icons.pie_chart_outlined)),
      //       BottomNavigationBarItem(
      //           title: Container(), icon: Icon(Icons.supervised_user_circle))
      //     ]),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajaRosada = Transform.rotate(
        // la rotacion le tenemos que dar el angulo
        angle: -pi / 5.0,
        child: Container(
          //  es una caja
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(236, 98, 188, 1.0),
                Color.fromRGBO(241, 172, 172, 1.0),
              ])),
        ));

    return Stack(
      children: [
        gradiente,
        Positioned(
            // va a subir la caja un poco mas arriba
            top: -100.0,
            child: cajaRosada)
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classify transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Classify this transaction into a particular category',
                style: TextStyle(color: Colors.white, fontSize: 18.0)),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
        // copiamos el tema actual
        data: Theme.of(context).copyWith(
            // cambiamos el color de fondo
            canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
            // color primario
            primaryColor: Colors.pinkAccent,
            // cambiar el texto secundario
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
        child: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              // lo dejamos sin texto, pero es obli. titulo
              title: Container(),
              icon: Icon(Icons.calendar_today, size: 30.0)),
          BottomNavigationBarItem(
              title: Container(), icon: Icon(Icons.bubble_chart, size: 30.0)),
          BottomNavigationBarItem(
              title: Container(),
              icon: Icon(Icons.supervised_user_circle, size: 30.0))
        ]));
  }

  Widget _botonesRedondeados() {
    return Table(
      children: [
        // en posicion horizontral
        TableRow(children: [_card(Colors.green, Icons.access_alarm, 'General'), _card(Colors.blue, Icons.access_alarm, 'Alarm')]),
        TableRow(children: [_card(Colors.purpleAccent, Icons.directions_bus, 'Bus'), _card(Colors.red, Icons.recent_actors, 'Actor')]),
        TableRow(children: [_card(Colors.lightBlue, Icons.accessibility_new, 'New'), _card(Colors.pinkAccent, Icons.swap_horiz, 'Horiz')]),
      ],
    );
  }

  Widget _card(Color color, IconData icono, String texto) {
    return Container(
			height: 160.0,
			margin: EdgeInsets.all(15.0),
			decoration: BoxDecoration(
				color: Color.fromRGBO(62, 66, 107, 0.7),
				borderRadius:  BorderRadius.circular(20.0)
			),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: [
					CircleAvatar(
						backgroundColor: color,
						radius: 35.0,
						child: Icon(icono, color: Colors.white, size: 30.0),
					),
					Text(texto, style: TextStyle(color: color)),
				],
			),
		);
  }

	Widget _crearBotonRedondeado( Color color, IconData icono, String texto ) {
 
    return ClipRect(
			// BackdropFilter: Para darle un blur a la card que se vea borrozo el fondo.
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 10.0, sigmaY: 10.0 ),
        child: Container(
          height: 160.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox( height: 5.0 ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon( icono, color: Colors.white, size: 30.0 ),
              ),
              Text( texto , style: TextStyle( color: color )),
              SizedBox( height: 5.0 )
            ],
          ),
 
        ),
      ),
    );
  }
}
