import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      // body: _crearLista(),
    );
  }

  Widget _crearLista() {
    // Van a ser dinamicos.
    // se va a encargar de rendarizar los elementos cuan forme sea necesarios, se usa para una lista muy grande
    return ListView.builder(itemBuilder: null);
  }
}
