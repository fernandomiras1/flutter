import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temps'),
      ),
      body: ListView(
        children: _crearItemCorto(),
      ),
    );
  }

  // Forma 1
  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  // Forma 2 (corto)
  List<Widget> _crearItemCorto() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: Text('subtitle'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
