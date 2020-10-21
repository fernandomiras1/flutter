import 'package:estados_singleton_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados_singleton_app/bloc/usuario/user_cubit.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userCubit = context.bloc<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => userCubit.borrarUsuario()
          )
        ],
      ),
      body: BodyScaffold(),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.accessibility_new),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')),
   );
  }
}

class BodyScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (context, state) {
        
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No existe usuario'));
            break;

          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);
            break;

          default:
            return Center(child: Text('Estado no reconocido'));
        }
        // if ( state is UsuarioInitial) {
        //   return Center(child: Text('No existe usuario'));
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(state.usuario);
        // } else {
        //   return Center(child: Text('Estado no reconocido'));
        // }
        
      }
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
          ...usuario.profesiones
            .map((profesion) => ListTile(title: Text(profesion))).toList()
        ],
      ),
    );
  }
}