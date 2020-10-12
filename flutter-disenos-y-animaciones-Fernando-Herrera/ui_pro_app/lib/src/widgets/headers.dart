import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB)
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // es el lapiz
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Color(0xff615AAB);
    // rellenado
    lapiz.style = PaintingStyle.fill;
    // que tan ancho que sea el lapiz
    lapiz.strokeWidth = 2;

    final path = new Path();
    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    // que dibuje
    canvas.drawPath(path, lapiz);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // es el lapiz
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Color(0xff615AAB);
    // rellenado
    lapiz.style = PaintingStyle.fill;
    // que tan ancho que sea el lapiz
    lapiz.strokeWidth = 2;

    final path = new Path();
    // Dibujar con el path y el lapiz
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // que dibuje
    canvas.drawPath(path, lapiz);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // es el lapiz
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Color(0xff615AAB);
    // rellenado
    lapiz.style = PaintingStyle.fill;
    // que tan ancho que sea el lapiz
    lapiz.strokeWidth = 20;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);


    // que dibuje
    canvas.drawPath(path, lapiz);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // es el lapiz
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Color(0xff615AAB);
    // rellenado
    lapiz.style = PaintingStyle.fill;
    // que tan ancho que sea el lapiz
    lapiz.strokeWidth = 20;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    // los dos ultimos valores, marcan el final de la linea
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40 ,size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // que dibuje
    canvas.drawPath(path, lapiz);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // es el lapiz
    final lapiz = new Paint();
    // propiedades
    lapiz.color = Color(0xff615AAB);
    // rellenado
    lapiz.style = PaintingStyle.fill;
    // que tan ancho que sea el lapiz
    lapiz.strokeWidth = 20;

    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    // los dos ultimos valores, marcan el final de la linea
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30 ,size.width * 0.5 , size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20 ,size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // que dibuje
    canvas.drawPath(path, lapiz);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}