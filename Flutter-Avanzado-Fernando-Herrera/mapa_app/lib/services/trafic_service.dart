import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:mapa_app/models/traffic_response.dart';

class TrafficService {

  // Singleton

  // Creamos un contructor privado
  TrafficService._privateContructor();
  static final TrafficService _instance = TrafficService._privateContructor();
  factory TrafficService() {
    return _instance;
  }


  final _dio = new Dio(); // para crear los query params
  final _baseUrl = 'https://api.mapbox.com/directions/v5';
  final _apiKey = 'pk.eyJ1IjoiZm1pcmFzIiwiYSI6ImNrZ283YnNteDBkOGQyeW5xeWZveXNwcmEifQ.chPIpxPseXOoHUPpaKvRfQ';


  Future<DrivingResponse> getCoordsInicioYDestino(LatLng inicio, LatLng destino) async {

    final coorString = '${inicio.longitude},${inicio.latitude};${destino.longitude},${destino.latitude}';
    final url = '${ this._baseUrl }/mapbox/driving/$coorString';

    final resp = await this._dio.get(url, queryParameters: {
      'alternatives': 'true',
      'geometries': 'polyline6',
      'steps': 'false',
      'access_token': this._apiKey,
      'language': 'es',
    });

    final data = DrivingResponse.fromJson(resp.data);
    print(data);
    return data;

  }




}