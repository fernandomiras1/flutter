import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';

// plugin de mapa
import 'package:flutter_map/flutter_map.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();
	String tipoMapa = 'streets-v11';

  @override
  Widget build(BuildContext context) {
    // obtenemos las cords mediante los argumentos
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: [
          IconButton(icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              map.move(scan.getLatLng(), 15);
            });
          })
        ],
      ),
      body: _crearFlutterMap(scan),
      floatingActionButton: _crearBtnFlotante(context),
    );
  }

  Widget _crearBtnFlotante(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if ( tipoMapa == 'streets-v11') {
          tipoMapa = 'dark-v10';
        } else if ( tipoMapa == 'dark-v10') {
           tipoMapa = 'light-v10';
        } else if ( tipoMapa == 'light-v10') {
           tipoMapa = 'outdoors-v11';
        } else if ( tipoMapa == 'outdoors-v11') {
           tipoMapa = 'satellite-v9';
        } else {
          tipoMapa = 'streets-v11';
        }

        setState(() {});
      },
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 12
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan)
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
      // q servidor me va a proveer el mapa
      urlTemplate: 'https://api.mapbox.com/styles/v1/'
      '{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}',
      additionalOptions: {
        'accessToken':'pk.eyJ1IjoiZm1pcmFzIiwiYSI6ImNrZnpxOXp4ejB2eXQzMHNjejNocmJweTgifQ.KLw3EtkvjlMVMpMqIMgS7w',
        'id': 'mapbox/$tipoMapa'
      }
    );
  }

  _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(
      markers: [
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (context) => Container(
            child: Icon(
              Icons.location_on,
              size: 70.0,
              color: Theme.of(context).primaryColor,
            ),
          )
        )  
      ]
    );
  }
}
