import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = '9f3b844fce4277406695a3f819f02fb9';
  String _url = 'api.themoviedb.org';
  String _lenguage = 'es-ES';
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();
  // Corriente de datos - Flujo de datos
  // broadcast muchos lugares donde este escuichando la misma edicion
  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  // Agregar informacion al flujo de Stream
  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  // escuchar el flujo de informacion
  Stream<List<Pelicula>> get popularesStrem =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    //decode: va a tomar el string de la respuesta como un string lo va a trasforamr en un mapa
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _lenguage});

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) return [];
    _cargando = true;
    _popularesPage++; // siguente pagina.
    print('Cargando siguientes...');
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _lenguage,
      'page': _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);
    // lo agregamos en la lista que creamos. para luego pasarlo por el stream de datos.
    _populares.addAll(resp);
    // colocar al inicio del strem de datos.
    popularesSink(_populares);
    _cargando = false;
    return resp;
  }

  Future<List<Actor>> getCats(String peliId) async {
    final url = Uri.https(_url, '3/movie/$peliId/credits',
        {'api_key': _apikey, 'language': _lenguage});

    final resp = await http.get(url);
    //decode: va a tomar el string de la respuesta como un string lo va a trasforamr en un mapa
    final decodedData = json.decode(resp.body);

    final cast = new Cast.fromJsonList(decodedData['cast']);

    return cast.actores;
  }

	  Future<List<Pelicula>> buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
			'api_key': _apikey,
			'language': _lenguage,
			'query': query
		});

    return await _procesarRespuesta(url);
  }
}
