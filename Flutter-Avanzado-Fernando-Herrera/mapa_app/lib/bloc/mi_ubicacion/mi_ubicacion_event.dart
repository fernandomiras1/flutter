part of 'mi_ubicacion_bloc.dart';

@immutable
abstract class MiUbicacionEvent {}

// On: porque es un evento.
class OnUbicacionCambio extends MiUbicacionEvent {
  
  final LatLng ubicacion;
  OnUbicacionCambio(this.ubicacion);

}
