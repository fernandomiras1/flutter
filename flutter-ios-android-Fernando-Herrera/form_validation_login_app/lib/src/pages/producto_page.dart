import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_validation_login_app/src/models/producto_model.dart';
import 'package:form_validation_login_app/src/providers/productos_provider.dart';
import 'package:form_validation_login_app/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ProductoModel producto = new ProductoModel();
  bool _guardando = false;
  File photo;
  // Mi servicio. q se va a comunicar con FireBase
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
     // si el produto es nuevo o viene con argumentos
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;
    if ( prodData != null) {
      // edicion: seteamos los valors en los input
      producto = prodData;
    }
    return Scaffold(
      //key: una referencia unica al Scaffold
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual), 
            onPressed: _seleccionarFoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt), 
            onPressed: _tomarFoto,
          ),
          
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(context)
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    // trabaja con el Widget de Form
    return TextFormField(
      initialValue: producto.titulo,
      // por oraciones
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value) => producto.titulo = value,
      validator: (String value) {
        if ( value.length < 3) {
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    // trabaja con el Widget de Form
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true
      ),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {
        // que sea un numero a fuerza
        if ( utils.isNumeric(value)) {
          return null;
        } else {
          return 'Sólo numeros';
        }
      },
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState(() {
        producto.disponible = value;
      }),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      textColor: Colors.white,
      color: Colors.deepPurple,
      onPressed: (_guardando) ? null : () => _submit(context)
    );
  }

  void _submit(BuildContext context) async {
    // true si el formulario es valido o false si no es valido
    if (!formKey.currentState.validate()) return;

    // va a dispara el metodo de todos los textFilfers
    formKey.currentState.save();
    // para poder bloquear el btn.
    setState(() { _guardando = true; });

    if (photo != null) {
      // subimos la foto
      producto.fotoUrl = await productosProvider.subirImagen(photo);
    }

    if (producto.id == null) {
      // estoy en el alta
      productosProvider.crearProducto(producto);
    } else {
      // en modo edicion
      productosProvider.editarProducto(producto);
    }

    mostrarSnackBar('Registro Guardado');
    // navegamos a la lista de productos
    Navigator.pop(context);
  }

  void mostrarSnackBar(String mensaje) {
    final snackBar = SnackBar(
      content: Text(mensaje),
      backgroundColor: Colors.deepPurple,
      duration: Duration(milliseconds: 1500),
    );

    // necesitamos una referenencai al Scaffold
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget _mostrarFoto() {
    if (producto.fotoUrl != null) {
      return FadeInImage(
        image: NetworkImage(producto.fotoUrl),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300.0,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
      return Image(
        image: AssetImage( photo?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  // por las didas que no ante en _mostrarFoto
  Widget _mostrarFotoSinErrores() {
 
    if (producto.fotoUrl != null) {
 
      return Container();
 
    } else {
 
      if( photo != null ){
        return Image.file(
          photo,
          fit: BoxFit.cover,
          height: 300.0,
        );
      }
      return Image.asset('assets/no-image.png');
    }
  }

  _seleccionarFoto() async {
    _processImage(ImageSource.gallery);
  }

  _tomarFoto() async {
    _processImage(ImageSource.camera);
  }

  _processImage(ImageSource origin) async {
    final _picker = ImagePicker();
 
    final pickedFile = await _picker.getImage(
      source: origin,
    );
    
    photo = File(pickedFile.path);
 
    if (photo != null) {
      producto.fotoUrl = null;
    }
 
    setState(() {});
  }

}