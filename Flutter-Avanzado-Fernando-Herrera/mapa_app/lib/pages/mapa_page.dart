import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa_app/bloc/mapa/mapa_bloc.dart';
import 'package:mapa_app/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';

import 'package:mapa_app/widgets/widgets.dart';


class MapaPage extends StatefulWidget {

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  @override
  void initState() {
    // se llama pór unica vez cuando se inicia el MAPA
    context.bloc<MiUbicacionBloc>().iniciarSeguimineto();
    super.initState();
  }
  
  @override
  void dispose() {
    context.bloc<MiUbicacionBloc>().cancelarSeguimiento();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<MiUbicacionBloc, MiUbicacionState>(
        builder: (_, state) => crearMapa(state)
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BtnUbicacion()
        ],
      ),
   );
  }

  Widget crearMapa(MiUbicacionState state) {
    if ( !state.existeUbicacion ) return Center(child: Text('Ubicando...'));

      final mapaBloc = BlocProvider.of<MapaBloc>(context);
      
      final camaraPosition = new CameraPosition(
        // ubicacion inical
        target: state.ubicacion,
        zoom: 15
      );
      
      return GoogleMap(
        initialCameraPosition: camaraPosition,
        myLocationEnabled: true, // aparece el punto azul de mi ubicacion
        myLocationButtonEnabled: false, // me lleva a la ubicacion de mi punto
        zoomControlsEnabled: false,
        // tipos de mapas
        // mapType: MapType.hybrid,
        // solo se dispara una vez, cuando el mapa esta creado y listo.
        onMapCreated: mapaBloc.initMapa,
      );
  }
}