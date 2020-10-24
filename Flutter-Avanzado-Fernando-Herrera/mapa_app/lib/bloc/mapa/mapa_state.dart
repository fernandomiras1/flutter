part of 'mapa_bloc.dart';

@immutable
class MapaState {

  final bool mapaListo;
  final bool dibujarRecorrido;
  final bool seguirUbicacion;
  final LatLng ubicacionCentral;


  // Polylines ( las lineas )
  final Map<String, Polyline> polylines;

  MapaState({
    bool this.mapaListo = false,
    bool this.dibujarRecorrido = false,
    bool this.seguirUbicacion = false,
    LatLng this.ubicacionCentral,
    Map<String, Polyline> polylines,
  }): this.polylines = polylines ?? new Map();

  copyWith({
    bool mapaListo,
    bool dibujarRecorrido,
    bool seguirUbicacion,
    LatLng ubicacionCentral,
    Map<String, Polyline> polylines
  }) => new MapaState(
    mapaListo: mapaListo ?? this.mapaListo,
    polylines: polylines ?? this.polylines,
    ubicacionCentral: ubicacionCentral ?? this.ubicacionCentral,
    seguirUbicacion : seguirUbicacion  ?? this.seguirUbicacion,
    dibujarRecorrido: dibujarRecorrido ?? this.dibujarRecorrido,
  );
}

