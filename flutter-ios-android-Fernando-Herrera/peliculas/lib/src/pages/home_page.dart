import 'package:flutter/material.dart';
import 'package:peliculas/src/search/search_delegate.dart';

// widget personalizado
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal_widget.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    // llamaos al metodo que nos trae las peliculas
    peliculasProvider.getPopulares();

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Péliculas en cines'),
          backgroundColor: Colors.indigoAccent,
          actions: [
            IconButton(
							icon: Icon(Icons.search),
							onPressed: () {
								showSearch(
									context: context, 
									delegate: DataSearch(),
									// que abra el search con la busqueda precargada
									query: 'batman'
								);
							})
          ],
        ),
        // SafeArea: para ios o celulares que tiene un hueco en el microfono.
        body: Container(
          child: Column(
            // para que se vena los dos tanto las tarhetas como el fotter bien organizo del espacio
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ Expanded(child: _swiperTarjetas()) ,_footer(context)],
          ),
        ));
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        // widget personalizado
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          //loadin: cuando el feature se esta resolviendo.
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      // para que agarre todo el espacio
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Theme.of(context).textTheme Permite configurar los stylos global en toda mi app
          Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Populares',
                  style: Theme.of(context).textTheme.subtitle1)),
          SizedBox(height: 5.0),
          StreamBuilder(
            stream: peliculasProvider.popularesStrem,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina: peliculasProvider.getPopulares,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
