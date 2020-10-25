part of 'widgets.dart';

class MarcadorManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusquedaBloc, BusquedaState>(
      builder: (context, state) {
        if ( state.seleccionManual) {
          return _BuildMarcadorManual();
        }

        return Container();
      },
    );
  
  }

}

class _BuildMarcadorManual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // obtengo todo el ancho de la pantalla.
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Boton Regresar
        Positioned(
          top: 70,
          left: 20,
          child: FadeInLeft(
            duration: Duration(milliseconds: 250),
            child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: () {
                  context.bloc<BusquedaBloc>().add(OnDesactivarMarcadorManual());
                }
              ),
            ),
          )
        ),

        //Marcador
        Center(
          child: Transform.translate(
            offset: Offset(0, -20),
            child: BounceInDown(
              from: 200,
              child: Icon(Icons.location_on, size: 50)
            )
          ),
        ),

        // Boton de confirmar destino
        Positioned(
          bottom: 70,
          left: 40,
          child: FadeIn(
            child: MaterialButton(
              minWidth: width - 120,
              child: Text('Confirmar destino', style: TextStyle(color: Colors.white)),
              color: Colors.black87,
              shape: StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              onPressed: () {
                // Confirmar Destino.
                this._calcularDestino(context); 
              }
            ),
          )
        )
      ],
    );
  }

  void _calcularDestino(BuildContext context) async {
    // mostramos una modal con el cartel espere por favor
    calculandoAlerta(context);

    final mapaBloc = context.bloc<MapaBloc>();
    // Llamar al servico de MapBox
    final trafficService = new TrafficService();
    // mi ultima ubicacion del usuario
    final inicio = context.bloc<MiUbicacionBloc>().state.ubicacion;
    // donde se encuentra el destino del ping
    final destino = mapaBloc.state.ubicacionCentral;
    
    final trafficResponse =  await trafficService.getCoordsInicioYDestino(inicio, destino);

    final String geometry = trafficResponse.routes[0].geometry;
    final double duracion = trafficResponse.routes[0].duration;
    final double distancia = trafficResponse.routes[0].distance;
    // Decodificar los puntos del geometry. El paquete de polyline 1.0.2
    final points = Poly.Polyline.Decode(encodedString: geometry, precision: 6).decodedCoords;
    final List<LatLng> rutaCoordenadas = points.map((point) => LatLng(point[0], point[1])).toList();


    mapaBloc.add(OnCrearRutaInicioDestino(rutaCoordenadas, distancia, duracion));

    // cerramos el modal
    Navigator.of(context).pop();
    // Quitar el confirmar destino, marcador y el boton para registrar.
    context.bloc<BusquedaBloc>().add(OnDesactivarMarcadorManual());

    

  }
}