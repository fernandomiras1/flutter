import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TwitterPage extends StatefulWidget {

  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {

  bool activar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          // lo vamos a querer 30 veces mas grande
          from: 30,
          // q no se anime
          animate: activar,
          duration: Duration(seconds: 1),
          child: FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 40)
        ),
     ),
     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.grey,
       elevation: 10,
       child: FaIcon(FontAwesomeIcons.play),
       onPressed: () {
         setState(() {
           activar = true;
         });
       },
      ),
   );
  }
}