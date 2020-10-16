import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  final Color color;

  const HeaderWave({ @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(this.color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  
  final Color color;

  _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    // es el lapiz
    final lapiz = new Paint();
    // propiedades
    lapiz.color = this.color; //Color(0xff615AAB);
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

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  IconHeader({
    this.icon,
    @required this.titulo,
    @required this.subtitulo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey
  });


  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon, size: 250, color: Colors.white.withOpacity(0.2))
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity),
            Text(this.titulo, style: TextStyle(fontSize: 20, color: colorBlanco)),
            SizedBox(height: 20),
            Text(this.subtitulo, style: TextStyle(fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            FaIcon(this.icon, size: 80, color: Colors.white)
          ],
        )
      ]
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  
  const _IconHeaderBackground({
    @required this.color1,
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            this.color1,
            this.color2,
          ]
        )
      ),
    );
  }
}