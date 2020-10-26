part of 'mapa_bloc.dart';

@immutable
class MapaState {

  final bool mapaListo;
  final bool dibujarRecorrido;
  final bool seguirUbicacion;
  final LatLng ubicacionCentral;


  // Polylines ( las lineas )
  final Map<String, Polyline> polylines;
  // manejar todos los markadores
  final Map<String, Marker> markers;

  MapaState({
    bool this.mapaListo = false,
    bool this.dibujarRecorrido = false,
    bool this.seguirUbicacion = false,
    LatLng this.ubicacionCentral,
    Map<String, Polyline> polylines,
    Map<String, Marker>   markers,
  }): this.polylines = polylines ?? new Map(),
      this.markers   = markers   ?? new Map();

  copyWith({
    bool mapaListo,
    bool dibujarRecorrido,
    bool seguirUbicacion,
    LatLng ubicacionCentral,
    Map<String, Polyline> polylines,
    Map<String, Marker>   markers,
  }) => new MapaState(
    mapaListo: mapaListo ?? this.mapaListo,
    polylines: polylines ?? this.polylines,
    markers  : markers   ?? this.markers,
    ubicacionCentral: ubicacionCentral ?? this.ubicacionCentral,
    seguirUbicacion : seguirUbicacion  ?? this.seguirUbicacion,
    dibujarRecorrido: dibujarRecorrido ?? this.dibujarRecorrido,
  );
}

