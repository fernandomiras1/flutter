import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Navegacion'),
        ),
       floatingActionButton: BotonFlotante(),
       bottomNavigationBar: BottomNavigation(),
   ),
    );
  }
}


class BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;
    
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone)
        ),

        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                // child: Icon(Icons.brightness_1, size: 8, color: Colors.redAccent)
                child: BounceInDown(
                  // que tan alqui quiero que caiga la animcacion
                  from: 10,
                  animate: (numero > 0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controlle) => Provider.of<_NotificationModel>(context).bounceController = controlle,
                    child: Container(
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        // al cuadrado lo hacemos un circulo
                        shape: BoxShape.circle
                      ),
                      child: Text('$numero', style: TextStyle(color: Colors.white, fontSize: 7)),
                    ),
                  ),
                ),
              )
            ]
          )
        ),
        BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog)
        ),
      ]
    );
  }
}


class BotonFlotante extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () {
        int numero = Provider.of<_NotificationModel>(context, listen: false).numero;
        numero++;
        // actalizamos el privder
        Provider.of<_NotificationModel>(context, listen: false).numero = numero;

        if ( numero >= 2 ) {
          final controller = Provider.of<_NotificationModel>(context, listen: false).bounceController;
          controller.forward(from: 0.0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {

  int _numero = 0;
  AnimationController _bounceController;

  int get numero => this._numero;

  set numero(int value) {
    this._numero = value;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }

}