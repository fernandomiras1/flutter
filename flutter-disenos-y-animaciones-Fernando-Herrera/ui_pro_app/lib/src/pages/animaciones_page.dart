import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  
  // control para manejar la animacion
  AnimationController controller;
  // el cuadro rote en su propio eje
  Animation<double> rotacion;

  // ciclos de vida
  @override
  void initState() {
    controller = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: 4000) // q dure 4 seg la animacion
    );

    // que tipo de animacion quiero.
    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut)
    );

    // escucahmos la animacion
    controller.addListener(() {

      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }

    });
    
    // le de play a la animacion
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

   

    return AnimatedBuilder(
      animation: controller,
      child: _Cuadrado(),
      builder: (BuildContext context, Widget child) {
        print(rotacion.value);
        return Transform.rotate(
          angle: rotacion.value,
          child: child
        );
      }
    );
  }
}



class _Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}