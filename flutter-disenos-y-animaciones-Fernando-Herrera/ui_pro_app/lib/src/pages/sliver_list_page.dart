import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_pro_app/src/theme/theme.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            // al fondo
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          ),
        ]
      )
   );
  }
}

class _BotonNewList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 80,
      child: RaisedButton(
        onPressed: () {},
        color: (appTheme.darkTheme) ? accentColor : Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: appTheme.currentTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            // separacion de las letras
            letterSpacing: 3
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: [
        // El de material por defecto
        // SliverAppBar(
        //   // cuando haga scroll hacia arriba va a parecer el header.
        //   // como esta en Ncom.
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('GER'),
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 170,
            maxheight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo(),
            )
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100)
          ])
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minheight,
    @required this.maxheight,
    @required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      return SizedBox.expand(child: child);
    }
  
    @override
    // El tamaño maximo que se puede extender 
    double get maxExtent => (minheight > maxheight) ? minheight : maxheight;
  
    @override
    double get minExtent => minheight;
  
    @override
    bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // que se deba redibujar
    return maxheight != oldDelegate.maxExtent || 
           minheight != oldDelegate.minExtent;
  }

}

class _ListaTareas extends StatelessWidget {

  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index]
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
              fontSize: 50
            )
          ),
        ),
        Stack(
          children: [
            SizedBox(width: 100),
            // linea
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5)
              )
            ),
            Container(
              child: Text('List', style: TextStyle(color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold)),
            ),
          ]
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {

  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        this.titulo,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
      padding: EdgeInsets.all(30),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : this.color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}