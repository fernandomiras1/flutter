import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:mapa_app/helpers/helpers.dart';
import 'package:mapa_app/pages/acceso_gps_page.dart';
import 'package:mapa_app/pages/mapa_page.dart';


class LoadingPage extends StatefulWidget {

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {


  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /*
   * Necesitamos saber cuando el usuario activa el GPS de lo setting.
   * Al regresar a la aplicacion, tiene que navegar al MAPA. 
   * Para eso usamos el  didChangeAppLifecycleState para este WidgetsBinding
  */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      // Verificamos que realmente tenga el GPS activado.
      if ( await Geolocator.isLocationServiceEnabled() ) {
        Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage()));
      }
    }  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkGpsYLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if ( snapshot.hasData ) {
            return Center(child: Text(snapshot.data));
          }

          return Center(child: CircularProgressIndicator(strokeWidth: 2));
        },
      ),
   );
  }

  Future checkGpsYLocation(BuildContext context) async {
    // PermisoGPS
    final permisoGPS = await Permission.location.isGranted;
    // GPS esta actvico
    final bool gpsActivo = await Geolocator.isLocationServiceEnabled();

    if (permisoGPS && gpsActivo) {
      Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage()));
      return '';
    } else if (!permisoGPS) {
      Navigator.pushReplacement(context, navegarMapaFadeIn(context, AccesoGpsPage()));
      return 'Es necesario el permiso de GPS';
    } else {
      return 'Active el GPS';
    }

  }
}