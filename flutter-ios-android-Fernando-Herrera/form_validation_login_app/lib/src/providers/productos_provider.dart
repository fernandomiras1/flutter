import 'dart:convert';
import 'dart:io';
import 'package:mime_type/mime_type.dart';
import 'package:form_validation_login_app/src/models/producto_model.dart';
import 'package:http_parser/http_parser.dart';
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

  Future<String> subirImagen( File imagen ) async {

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dm1yhhpxa/image/upload?upload_preset=khornlac');
    final mimeType = mime(imagen.path).split('/'); //image/jpeg

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType( mimeType[0], mimeType[1] ) // el primero image y depues el jpeg
    );

    imageUploadRequest.files.add(file);


    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if ( resp.statusCode != 200 && resp.statusCode != 201 ) {
      print('Algo salio mal');
      print( resp.body );
      return null;
    }

    final respData = json.decode(resp.body);
    print( respData);
    // obtenemos la url de donde se encuentra mi imagen.
    return respData['secure_url'];


  }


}