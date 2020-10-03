import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _crearImagen(),
          _crearTitulo(),
          _crearAcciones(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
        ],
      ),
    );
  }

  Widget _crearImagen() {
    return Image(
        image: NetworkImage(
            'https://cdn.pixabay.com/photo/2012/08/27/14/19/evening-55067__340.png'));
  }

  Widget _crearTitulo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: [
          // Todo el espacio diponible sin robarle el espacio al texto y al icono.
          Expanded(
            child: Column(
              // Todo hacia la izquierda. crossAxis se usa para los Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alta vista', style: estiloTitulo),
                // separamos un poco
                SizedBox(height: 7.0),
                Text('Linas motañas', style: estiloSubTitulo),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 30.0,
          ),
          Text('41', style: TextStyle(fontSize: 20.0))
        ],
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        SizedBox(height: 5.0),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue))
      ],
    );
  }

  Widget _crearTexto() {
    return Container(
			padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        'Lorem occaecat ex magna exercitation qui cupidatat nulla minim exercitation. Enim sint ad incididunt reprehenderit aute magna anim mollit nulla ipsum voluptate. Quis dolor ut irure sint adipisicing. Ea reprehenderit reprehenderit deserunt voluptate reprehenderit Lorem anim veniam dolore pariatur in nisi aute.',
				textAlign: TextAlign.justify),
    );
  }
}
