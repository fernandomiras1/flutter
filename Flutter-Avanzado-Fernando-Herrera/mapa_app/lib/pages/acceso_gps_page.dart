import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class AccesoGpsPage extends StatefulWidget {

  @override
  _AccesoGpsPageState createState() => _AccesoGpsPageState();
}

// WidgetsBindingObserver: me permite estar pendiendtes de los cambios de mi app, si se cierra o inicia. en fin
// si se abrio o se cerro la app. por ejemplo. en este caso cuando vovlemos del setting detectamos eso.
class _AccesoGpsPageState extends State<AccesoGpsPage> with WidgetsBindingObserver {

  @override
  void initState() {
    // para que este escuchando los estados de este widgets
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // detectamos cuando cambia el estado de mi aplicacion.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
   print('======> $state');
   // si ya le dimos permisos desde los setting que no te muestre el btotn
   if (state == AppLifecycleState.resumed) {
     if ( await Permission.location.isGranted ) {
       Navigator.pushReplacementNamed(context, 'loading');
     }
   }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Es necesario el GPS para usar esta app'),
            MaterialButton(
              child: Text('Solicitar Acceso', style: TextStyle(color: Colors.white)),
              color: Colors.black,
              shape: StadiumBorder(),
              elevation: 0,
              // para que no se pueda ver el repply
              splashColor: Colors.transparent,
              onPressed: () async {
                // verificar Permisos. te va a soliciatar q actices el GPS
                final status = await Permission.location.request();
                this.accesoGPS(status);
                print(status);
              }
            )
          ],
        ),
     ),
   );
  }

  void accesoGPS(PermissionStatus status) {

    switch (status) {
      // tiene el acceso a la localizacion
      case PermissionStatus.granted:
        // Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage()));
        Navigator.pushReplacementNamed(context, 'mapa');
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.undetermined:
      case PermissionStatus.permanentlyDenied:
        // abrimos las setting del telefono
        openAppSettings();
        break;
    }

  }
}