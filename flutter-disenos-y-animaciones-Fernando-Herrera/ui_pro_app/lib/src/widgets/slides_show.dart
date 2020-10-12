import 'package:flutter/material.dart';

// Provider es como REDUX ( Manejo de Estados )
import 'package:provider/provider.dart';

class SlidesShow extends StatelessWidget {

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  SlidesShow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              // seteamos los colores al Provider.
              Provider.of<_SliderModel>(context).colorPrimario   = colorPrimario;
              Provider.of<_SliderModel>(context).colorSecundario = colorSecundario;
              // tamaño
              Provider.of<_SliderModel>(context).bulletPrimario   = bulletPrimario;
              Provider.of<_SliderModel>(context).bulletSecundario = bulletSecundario;

              return Column(
                children: [
                  if (puntosArriba) _Dots(slides.length),
                  Expanded(child: _Slides(slides)),
                  if (!puntosArriba) _Dots(slides.length),
                ],
              );
            }
          )
        ),
      ),
    );
  }
}


class _Dots extends StatelessWidget {

  final int totalSlides;

  _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // me crea una lista dinamica
        children: List.generate(totalSlides, (index) => _Dot(index)),
        // children: [
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  
  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    // no hace falta el listen: false porque no estamos en el initState
    final slidesModel = Provider.of<_SliderModel>(context);
    double size;
    Color color;
    if (slidesModel.currentPage >= index - 0.5 && slidesModel.currentPage < index + 0.5) {
      size = slidesModel.bulletPrimario;
      color = slidesModel.colorPrimario;
    } else {
      size = slidesModel.bulletSecundario;
      color = slidesModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

// SvgPicture.asset('assets/svgs/slide-1.svg')

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    // Voy a estar escuchando cuando cambie el Slider
    pageViewController.addListener(() {
      // Actualizar el providerm SliderModel
      // Actualizamos el curretPage
      Provider.of<_SliderModel>(context, listen: false).currentPage = pageViewController.page;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((Widget slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderModel with ChangeNotifier {

  double _currentPage      = 0;
  Color _colorPrimario     = Colors.blue;
  Color _colorSecundario   = Colors.grey;
  double _bulletPrimario   = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    // va a notificar cuando cambie la pagina actual
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }
  
  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double size) {
    this._bulletPrimario = size;
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double size) {
    this._bulletSecundario = size;
  }

}