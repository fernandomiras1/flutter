import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart' show Colors, Offset;
import 'package:mapa_app/helpers/helpers.dart';
import 'package:mapa_app/themes/retro_map.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa_app/themes/uber_map.dart';


part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaState> {
  MapaBloc() : super(MapaState());

  // Controlador del mapa
  GoogleMapController _mapController;
  // Polylines
  Polyline _miRuta = new Polyline(
    polylineId: PolylineId('mi_ruta_id'),
    color: Colors.transparent,
    width: 4,
  );

  // es la ruta de MatBox.
  Polyline _miRutaDestino = new Polyline(
    polylineId: PolylineId('mi_ruta_destino_id'),
    color: Colors.black87,
    width: 4,
  );

  void initMapa(GoogleMapController controller) {

    if ( !state.mapaListo) {
      this._mapController = controller;
      // Tema Uber
      this._mapController.setMapStyle(jsonEncode(uberMapTheme));
      // Tema Retro
      // this._mapController.setMapStyle(jsonEncode(retroMapTheme));

      add(OnMapaListo());    
  
    }

  }

  void closeMapa() {
    this._mapController.dispose();
  }

  void moverCamara(LatLng destino) {
    final cameraUpdate = CameraUpdate.newLatLng(destino);
    this._mapController?.animateCamera(cameraUpdate);
  }

  @override
  Stream<MapaState> mapEventToState(MapaEvent event) async* {
    if ( event is OnMapaListo) {
      yield state.copyWith(mapaListo: true);

    } else if (event is OnNuevaUbicacion) {
      yield* this._onNuevaUbicacion(event);

    } else if ( event is OnMarcarRecorrido) {
      yield* this._onMarcarRecorrido(event);
    
    } else if ( event is OnSeguirUbicacion) {
      yield* this._onSeguirUbicacion(event);
    
    } else if (event is OnMovioMapa) {
      yield state.copyWith(ubicacionCentral: event.centroMapa);
    
    } else if ( event is OnCrearRutaInicioDestino) {
      yield* this._onCrearRutaInicioDestino(event);

    }
  }


  Stream<MapaState> _onNuevaUbicacion(OnNuevaUbicacion event) async* {

    if ( state.seguirUbicacion) {
      this.moverCamara(event.ubicacion);
    }
    // creamos la linea negra.
    List<LatLng> points = [ ...this._miRuta.points, event.ubicacion ];
    this._miRuta = this._miRuta.copyWith(pointsParam: points);
    // creame en mi state el listado
    final currentPolylines = state.polylines;
    currentPolylines['mi_ruta_id'] = this._miRuta;
    yield state.copyWith(polylines: currentPolylines);
  }

  Stream<MapaState> _onMarcarRecorrido(OnMarcarRecorrido event) async* {
    if (!state.dibujarRecorrido) {
      // ponemos color por defecto
      this._miRuta = this._miRuta.copyWith(colorParam: Colors.blue[400]);
    } else {
      this._miRuta = this._miRuta.copyWith(colorParam: Colors.transparent);
    }

    // creame en mi state el listado
    final currentPolylines = state.polylines;
    currentPolylines['mi_ruta_id'] = this._miRuta;
    yield state.copyWith(
      dibujarRecorrido: !state.dibujarRecorrido,
      polylines: currentPolylines
    );
  }

  Stream<MapaState> _onSeguirUbicacion(OnSeguirUbicacion event) async* {
    if (!state.seguirUbicacion) {
      // obtengo mi ultma ubicacion.
      this.moverCamara(this._miRuta.points[this._miRuta.points.length - 1 ]);
    }
    yield state.copyWith(seguirUbicacion: !state.seguirUbicacion);
  }

  Stream<MapaState> _onCrearRutaInicioDestino(OnCrearRutaInicioDestino event) async* {
      
    this._miRutaDestino = this._miRutaDestino.copyWith(
      pointsParam: event.rutaCoordenadas
    );
    
    final currentPolylines = state.polylines;
    currentPolylines['mi_ruta_destino_id'] = this._miRutaDestino;

    // Icono inicio
    // final iconInicio = await getAssetImageMarker();
    final iconInicio = await getMarkerInicioIcon(event.duracion.toInt());
    // final iconDestino = await getNetworkImageMarker();
    final iconDestino = await getMarkerDestinoIcon(event.nombreDestino, event.distancia);

    // Marcadores
    final markerInicio = new Marker(
      markerId: MarkerId('inicio'),
      position: event.rutaCoordenadas[0],
      icon: iconInicio,
      anchor: Offset(0.0,1.0),
      infoWindow: InfoWindow(
        title: 'Mi Ubicación',
        snippet: 'Duración recorrido: ${(event.duracion / 60).floor() } minutos',
        anchor: Offset(0.5,0)
      )
    );


    // pasamos de metros a kilometros
    double kilometros = event.distancia / 100;
    kilometros = (kilometros * 100).floor().toDouble();
    kilometros = kilometros / 100;

    final markerDestino = new Marker(
      markerId: MarkerId('destino'),
      position: event.rutaCoordenadas[event.rutaCoordenadas.length -1 ],
      icon: iconDestino,
       anchor: Offset(0.1,0.90),
      infoWindow: InfoWindow(
        title: event.nombreDestino,
        snippet: 'Distancia: $kilometros Km',
        anchor: Offset(0.5,0)
      )
    );


    final newMarkers = { ...state.markers };
    newMarkers['inicio']  = markerInicio;
    newMarkers['destino'] = markerDestino;

    // Vamos abir los markadores. para que esten abiertos
    Future.delayed(Duration(milliseconds: 300)).then(
      (value) {
        _mapController.showMarkerInfoWindow(MarkerId('destino'));
      }
    );

    yield state.copyWith(
      polylines: currentPolylines,
      markers: newMarkers
      // Marcadores    
    );
  }

}
