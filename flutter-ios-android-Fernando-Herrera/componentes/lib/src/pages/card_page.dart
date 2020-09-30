import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        // pading de todos los lados. es igual q css
        padding: EdgeInsets.all(20),
        children: [
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      // border en la card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.access_alarm,
              color: Colors.blue,
            ),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'Aqui estamos en en este curso, viendo si el texo esta andnado bien'),
          ),
          Row(
            // pone los btn al final
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      // no se va a salir el contenido de la misma
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // imagen con un loading
          FadeInImage(
              // la imagen real que se va a terminar renderizando
              image: NetworkImage('https://fondosmil.com/fondo/2255.jpg'),
              // la imagen q cumpliria en el loading img de los asstest
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              // como la imagen debe ocuar el espacio espesicio
              fit: BoxFit.cover),

          // Image(image: NetworkImage('https://fondosmil.com/fondo/2255.jpg')),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('No tengo idea de q poner'))
        ],
      ),
    );

    // Container es como un div en html
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 10.0))
            ]),
        // ClipRRect: nos va a permitir cortar cualquier cosa que este fuera de ese contenedor.
        child: ClipRRect(
          child: card,
          borderRadius: BorderRadius.circular(30.0),
        ));
  }
}
