import 'package:flutter/material.dart';
import 'package:form_validation_login_app/src/bloc/provider.dart';
import 'package:form_validation_login_app/src/models/producto_model.dart';

class HomePage extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    final productosBloc = Provider.productosBloc(context);
    // cargamos los productos
    productosBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot){
        if (snapshot.hasData) {
        final productos = snapshot.data;
    
        return ListView.builder(
          itemCount: productos.length,
          itemBuilder: (context, i) => _crearItem(context, productosBloc, productos[i])
        );
      }

      return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _crearItem(BuildContext context,ProductosBloc productosBloc, ProductoModel producto) {
    return Dismissible(
      // Dismissible desolizar izquierda o derecha y agregarle acciones. como btn
      key: UniqueKey(),
      // de derecha a izquierda
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: EdgeInsets.only(right: 20.0),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direccion) => productosBloc.borrarProducto(producto.id),
      child: Card(
        child: Column(
          children: [
            // si no tiene foto
            (producto.fotoUrl == null) 
            ? Image(image: AssetImage('assets/no-image.png'))
            : FadeInImage(
              image: NetworkImage(producto.fotoUrl),
              placeholder: AssetImage('assets/jar-loading.gif'),
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text('${producto.titulo} - ${producto.valor}'),
              subtitle: Text(producto.id),
              onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto),
            ),
          ],
        ),
      )
    );


   
  }
  
  Widget _crearBotonFlotante(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto')
    );
  }
}