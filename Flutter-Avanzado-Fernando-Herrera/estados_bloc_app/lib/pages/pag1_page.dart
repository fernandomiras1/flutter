import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_singleton_app/models/usuario.dart';
import 'package:estados_singleton_app/bloc/usuario/user_bloc.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => BlocProvider.of<UsuarioBloc>(context).add(BorrarUsuario())
          )
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        // cuando cambie el state, esto se va a volver a dibujar
        builder: (context, state) {
          if ( state.existeUsuario) {
            return InformacionUsuario(state.usuario);
          }

          return Center(child: Text('No hay un usuario seleccionado'));
        },
      ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.accessibility_new),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
  
          ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion))).toList()
        ],
      ),
    );
  }
}