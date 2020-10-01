import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  // Controlamos el Scroll.
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  // ciclo de vida es como el ngOnInit
  @override
  void initState() {
    super.initState();
    _agregar_10_ImagensMas();
    // Agregamos un liserent a ese scroll controller.
    // Se va a disparar cada vez que mueva el scroll
    _scrollController.addListener(() {
      // la posicion el pizel y el otro es el maximo de posision de pixeles ( el largo maximo q tiene ese scroll)
      // Quiere decir que estamos al final de la pagina
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar_10_ImagensMas();
        fetchData();
      }
    });
  }

  // tenemos que romper la subc al listener del scroll. OnDestroy
  // ciclo de vida, cuando salimos del componente
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      // Stack: los apilas unos encimas de
      body: Stack(
        children: [_crearLista(), _crearLoadin()],
      ),
    );
  }

  Widget _crearLista() {
    // Van a ser dinamicos.
    // se va a encargar de rendarizar los elementos conforme sea necesarios, se usa para una lista muy grande

    // itemCount: Cuantos elementos va a tener en ese momento.
    // itemBuilder: la forma como se va a digujar ese elemento
    // RefreshIndicator: para hacer pull to refresh
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
          // enlazamos el scroll controller.
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listaNumeros[index];
            return FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300/?image=$imagen'));
          }),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar_10_ImagensMas();
    });

    return Future.delayed(duration);
  }

  void _agregar_10_ImagensMas() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    // para que redibuje el ListView con los nuevos registros.
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuetaHTTP);
  }

  void respuetaHTTP() {
    _isLoading = false;
    // movemos el scroll un poco para abajo
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar_10_ImagensMas();
  }

  Widget _crearLoadin() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max, // que tome el maximo
        mainAxisAlignment: MainAxisAlignment.end, // q este al final
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container(); // porque siempre hay q regresar un Widget
    }
  }
}
