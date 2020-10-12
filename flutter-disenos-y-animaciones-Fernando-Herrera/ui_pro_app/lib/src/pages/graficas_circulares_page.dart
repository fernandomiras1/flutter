import 'package:flutter/material.dart';
import 'package:ui_pro_app/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  
  double porcentaje = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue, isGradient: true),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.purple),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if ( porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
        ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  
  final double porcentaje;
  final Color color;
  final bool isGradient;

  CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
    this.isGradient = false
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: Colors.grey,
        grosorPrimario: 10,
        grosorSecundario: 4,
        isGradient: isGradient,
      ),
    );
  }
}