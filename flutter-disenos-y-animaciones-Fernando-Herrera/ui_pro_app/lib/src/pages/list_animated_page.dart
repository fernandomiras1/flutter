import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ui_pro_app/src/widgets/card_icon_text.dart';
import 'package:ui_pro_app/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ItemCard {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemCard( this.icon, this.texto, this.color1, this.color2 );
}

class ListAnimatedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final items = <ItemCard>[
      new ItemCard( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemCard( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemCard( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemCard( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemCard( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemCard( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemCard( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemCard( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemCard( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemCard( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemCard( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemCard( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget> itemMap = items.map(
      (item) => FadeInLeft(
        // duration: Duration(milliseconds: 5000),
        child: CardIconText(
          icon: item.icon,
          texto: item.texto,
          color1: item.color1,
          color2: item.color2,
          onPress: () { print('hola');},
    ),
      )).toList();


    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
              child: ListView(
              // para que rebote la lista como ios
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 80),
                ...itemMap
              ],
            ),
          ),
          _Header()
        ],
      )
   );
  }
}

class _Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Haz solicitado',
          subtitulo: 'Asistencia Médica',
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.0),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white))
        )
      ],
    );
  }
}

class CardTemp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CardIconText(
      icon: FontAwesomeIcons.carCrash,
      texto: 'Motor Accident',
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5),
      onPress: () { print('Click'); },
    );
  }
}

class PageHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Haz solicitado',
      subtitulo: 'Asistencia Médica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}