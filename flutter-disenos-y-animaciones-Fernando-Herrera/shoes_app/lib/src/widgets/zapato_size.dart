import 'package:flutter/material.dart';
import 'package:shoes_app/src/pages/zapato_desc_page.dart';

class ZapatioSizePreview extends StatelessWidget {

  final bool fullScreen;

  ZapatioSizePreview({
    this.fullScreen = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ( !this.fullScreen) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        // padding: EdgeInsets.all( this.fullScreen ? 10 : 30),
        padding: EdgeInsets.symmetric(
          horizontal: this.fullScreen ? 5 : 30,
          vertical: this.fullScreen ? 5 : 0
        ),
        child: Container(
          width: double.infinity,
          height: this.fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Column(
            children: [
              // Zapato con su sombra.
              _ZapatoConSombra(),
              if (!this.fullScreen)
              _ZapatoTalles()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTalles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  
  final numero;

  _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: (this.numero == 9) ? Color(0xffF1A23A) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (this.numero == 9)
            BoxShadow(color: Color(0xffF1A23A), blurRadius: 10, offset: Offset(0,5))
        ]
      ),
      child: Text('$numero',
        style: TextStyle(
          color: (this.numero == 9) ? Colors.white : Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold
        )
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra()
          ),
          Image(image: AssetImage('assets/imgs/azul.png'))
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 30)
          ]
        ),
      ),
    );
  }
}