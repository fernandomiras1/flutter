import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({ 
    @required this.onPressed, 
    @required this.icon 
  });
}


class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items;
  final bool mostrarMenu;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  PinterestMenu({
    this.mostrarMenu = true,
    this.backgroundColor = Colors.white,
    this.activeColor     = Colors.black,
    this.inactiveColor   = Colors.blueGrey,
    @required this.items
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: mostrarMenu ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return _PinterestMenuBackground(
              child: _MenuItem(items)
            );
          },
        ),
      ),
    );
  }
  
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackground({ @required this.child});

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10, 
            spreadRadius: -5,
          )
        ]
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final List<PinterestButton> menuItem;
  _MenuItem(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItem.length, (index) => _PinterestMenuButton(index, menuItem[index]))
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);
  
  @override
  Widget build(BuildContext context) {

    final menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      // en algunos dipositicos no anda bien en onTap
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (menuModel.itemSeleccionado == index) ? 35 : 25,
          color: (menuModel.itemSeleccionado == index) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}


// Provider: Comunicacion entre Widgets
class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor     = Colors.black;
  Color inactiveColor   = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
}