import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    // Podemos saber datos del tamaño de la pantala de cada dispositivo
    // de esta forma voy a poder determinar el ancho y alto de mis tarjetas. Cosa que de adapten bien a cada dispositivo.
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        // estoy diciendo el 70% de ancho
        itemWidth: _screenSize.width * 0.7,
        // seria la mitad del dispositivo. 50 % de alto
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
					// va ser un id unico.
          peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';
          return Hero(
            tag: peliculas[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                // para q podamos hacer click y navegar a la pag detalle.
                onTap: () => Navigator.pushNamed(context, 'detalle',
                    arguments: peliculas[index]),
                child: FadeInImage(
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    image: NetworkImage(peliculas[index].getPosterImg()),
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
        itemCount: peliculas.length,
        // agrega los 3 puntinos
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
