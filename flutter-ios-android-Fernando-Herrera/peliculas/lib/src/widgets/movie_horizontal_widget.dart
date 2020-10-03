import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;
  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController = PageController(initialPage: 1, viewportFraction: 0.3);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    // obtener la posicion en pixecel. Se va a disparar cada vex que se mueva el page PageView
    // necesitamos saber cuando llegue al final
    _pageController.addListener(() {
      // le dejamos un margen de 200 antes de que llegue al final. Comienze a cargar los siguientes elementos.
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        print('Cargar siguientes peliculas');
        siguientePagina();
      }
    });

    return Container(
      // el 20% restante de la pantalla
      height: _screenSize.height * 0.30,
      // PageView.builder: porque va a traer el listado bajo onDeman, cuadno se vallan solicitrado.
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        // necesitamos espeficiar cuandos es el largo q tiene que renderizar.
        itemCount: peliculas.length,
        // necesitamos pasarle las card dependiendo del index-
        itemBuilder: (context, i) {
          return _tarjeta(context, peliculas[i]);
        },
      ),
    );
  }

  // es una sola card
  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
		 pelicula.uniqueId = '${pelicula.id}-poster';
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          // HERO; va hacer una trancicon hasta insertase en la pag de detalle.
          Hero(
						// es un id unico, para identificar la trasicion. Este id lo tenemos que vincular con el fin de la animasicon.
						// es este caso en la imagen de pelicua_detalle
						tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );

    // GestureDetector: es para poder hacer click a la tarjeta.
    return GestureDetector(
        child: tarjeta,
        onTap: () {
          // Navegamos a la pagina Detalle y le pasamos la pelicula
          Navigator.pushNamed(context, 'detalle', arguments: pelicula);
        });
  }

  // List<Widget> _tarjetas(BuildContext context) {
  //   return peliculas.map((pelicula) {
  //     return Container(
  //       margin: EdgeInsets.only(right: 15.0),
  //       child: Column(
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(20.0),
  //             child: FadeInImage(
  //               placeholder: AssetImage('assets/img/no-image.jpg'),
  //               image: NetworkImage(pelicula.getPosterImg()),
  //               fit: BoxFit.cover,
  //               height: 160.0,
  //             ),
  //           ),
  //           SizedBox(height: 5.0),
  //           Text(
  //             pelicula.title,
  //             overflow: TextOverflow.ellipsis,
  //             style: Theme.of(context).textTheme.caption,
  //           ),
  //         ],
  //       ),
  //     );
  //   }).toList();
  // }
}
