import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardIconText extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  CardIconText({
    this.icon = FontAwesomeIcons.plus,
    @required this.texto,
    this.color1 = Colors.purple,
    this.color2 = Colors.deepPurple,
    @required this.onPress
  });

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _CardBackground(
            icon: this.icon,
            color1: this.color1,
            color2: this.color2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40),
              FaIcon(this.icon, size: 40, color: Colors.white),
              SizedBox(width: 20),
              Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 18))),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;

  _CardBackground({this.color1, this.color2, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4,6),
            blurRadius: 10
          )
        ],
        gradient: LinearGradient(
          colors: [
            this.color1,
            this.color2,
          ]
        )
      ),
      child: ClipRRect(
        //ClipRRect: nada se sale de Witged
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              )
            )
          ]
        ),
      ),
    );
  }
}