import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// Para no importar todo el paquete si no lo que nos interesa.
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';


part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';

class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {
  MiUbicacionBloc() : super(MiUbicacionState());

  StreamSubscription<Position> _positionSubscription;

  void iniciarSeguimineto() {

    // necesitamos estar pendiente de todos los movimientos del telefono.
    _positionSubscription = Geolocator.getPositionStream(
      // desiredAccuracy: que tanta posision exacta queremos. (Mientas mas preciso queremos que sea mas consume bateria)
      desiredAccuracy: LocationAccuracy.high,
      // que tantos metros queremos que se mueva, para que el dispositivo emita el listen.
      distanceFilter: 10, // cada 10 metros que me emita.
    ).listen((Position position) {
      print(position);
      final nuevaUbicacion = new LatLng(position.latitude, position.longitude);
      // emitimos que cambio la ubicacion en event.
      add(OnUbicacionCambio(nuevaUbicacion));
    });
    
  }

  void cancelarSeguimiento() {
    // como es un listen, tenemos que romper la subcripcion cuando
    _positionSubscription?.cancel();
  }

  @override
  Stream<MiUbicacionState> mapEventToState(MiUbicacionEvent event) async* {

   if ( event is OnUbicacionCambio) {
     yield state.copyWith(
       existeUbicacion: true,
       ubicacion: event.ubicacion
     );

   }
  }
}
