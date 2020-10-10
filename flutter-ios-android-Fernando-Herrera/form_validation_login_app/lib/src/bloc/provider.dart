import 'package:flutter/material.dart';
import 'package:form_validation_login_app/src/bloc/login_bloc.dart';
export 'package:form_validation_login_app/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {

  static Provider _instancia;
  // generamos un sigleton para siempre devolver la misma intancia.
  factory Provider({Key key, Widget child }) {
    if (_instancia == null) {
      // creamos una nueva instancia
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }
 
  Provider._internal({Key key, Widget child })
    : super(key: key, child: child);

  final loginBloc = LoginBloc();


  // actualizar a los Widget hijos.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;


  static LoginBloc of ( BuildContext context ) {
   // valla a buscar en el contexto de LoginBloc cual es el pro
   return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }


}