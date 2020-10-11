import 'dart:convert';

import 'package:form_validation_login_app/src/models/producto_model.dart';
import 'package:http/http.dart' as http;


class ProductosProvider {

  // mi url de mi base de datos de firebase
  String _url = 'https://flutter-varios-75286.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto) async {

    final url = '$_url/productos.json';
    
    final resp = await http.post(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
 
  Future<bool> editarProducto(ProductoModel producto) async {

    final url = '$_url/productos/${producto.id}.json';
    // put: lo va a reemplazar ( editarlo )
    final resp = await http.put(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/productos.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();

    if ( decodedData == null ) return [];

    decodedData.forEach((id, prod) {
      final prodTeam = ProductoModel.fromJson(prod);
      prodTeam.id = id;
      productos.add(prodTeam);
    });

    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json';
    final resp = await http.delete(url);
    final decodedData = json.decode(resp.body);

    print(decodedData);

    return 1;

  }

}