import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_pro_app/src/theme/theme.dart';
import 'package:ui_pro_app/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ScrollHeaderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PiterestGrid(),
            _PinterestMenuLocation()
          ],
        ),
        // body: PiterestGrid(),
   ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Align(
          child: PinterestMenu(
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: () { print('pie_chart'); }),
              PinterestButton(icon: Icons.search, onPressed: () { print('search'); }),
              PinterestButton(icon: Icons.notifications, onPressed: () { print('notifications'); }),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: () { print('supervised_user_circle'); })
            ],
            backgroundColor: appTheme.scaffoldBackgroundColor,
            activeColor: appTheme.accentColor,
            // inactiveColor: Colors.black,
            mostrarMenu: mostrar,
          )
        ),
      )
    );
  }
}

class PiterestGrid extends StatefulWidget {

  @override
  _PiterestGridState createState() => _PiterestGridState();
}

class _PiterestGridState extends State<PiterestGrid> {

  final List<int> items = List.generate(200, (index) => index); 
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;
  @override
  void initState() {
    // escucahmos los eventos del scroll
    controller.addListener(() {
      print('Scroll ${ controller.offset}');
      // ocultar el menu
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(20))
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrarMenu = true;

  bool get mostrar => this._mostrarMenu;
  set mostrar(bool valor) {
    this._mostrarMenu = valor;
    notifyListeners();
  }
}