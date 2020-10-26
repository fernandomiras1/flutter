part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusquedaBloc, BusquedaState>(
      builder: (context, state) {
        return !state.seleccionManual 
          ? FadeInDown(child: this._buildSearchBar(context)) 
          : Container();
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: width,
        child: GestureDetector(
          onTap: () async {
            print('buscando');
            // la ultima ubicaicon conocida. esta en el state.ubicacion
            final proximidada = context.bloc<MiUbicacionBloc>().state.ubicacion;
            final List<SearchResult> historial = context.bloc<BusquedaBloc>().state.historial;
            final resultado = await showSearch(
              context: context,
              delegate: SearchDestination(proximidada, historial)
            );
            this.retronoBusqueda(context, resultado);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            width: double.infinity,
            child: Text('¿Dónde quieres ir?', style: TextStyle(color: Colors.black87)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 5)
                )
              ]
            ),
            // child: ,
          ),
        ),
      ),
    );
  }

  Future retronoBusqueda(BuildContext context, SearchResult result) async {
    if (result.cancelo) return;

    if (result.manual) {
      context.bloc<BusquedaBloc>().add(OnActivarMarcadorManual());
      return;
    }

    calculandoAlerta(context);
    // Calcular la ruta en base al valor del Result.
    final trafficService = new TrafficService();
    final mapaBloc = context.bloc<MapaBloc>();

    final inicio = context.bloc<MiUbicacionBloc>().state.ubicacion;
    final destino = result.position;
    final trafficResponse = await trafficService.getCoordsInicioYDestino(inicio, destino);

    final String geometry = trafficResponse.routes[0].geometry;
    final double duracion = trafficResponse.routes[0].duration;
    final double distancia = trafficResponse.routes[0].distance;
    final String nombreDestino = result.nombreDestino;

     // Decodificar los puntos del geometry. El paquete de polyline 1.0.2
    final points = Poly.Polyline.Decode(encodedString: geometry, precision: 6).decodedCoords;
    // el nuevo listado de mis nuevas coordenadas.
    final List<LatLng> rutaCoordenadas = points.map((point) => LatLng(point[0], point[1])).toList();
    // creamos la ruta en el mapa
    mapaBloc.add(OnCrearRutaInicioDestino(rutaCoordenadas, distancia, duracion, nombreDestino));

    // cerramos el modal
    Navigator.of(context).pop();

    // Agregar al Historial
    final busquedaBloc = context.bloc<BusquedaBloc>();
    busquedaBloc.add(OnAgregarHistorial(result));

  }
}