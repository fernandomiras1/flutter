import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Provider es como REDUX ( Manejo de Estados )
import 'package:provider/provider.dart';
import 'package:ui_pro_app/src/models/slider_model.dart';

class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
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
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5) 
                ? Colors.blue : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

// SvgPicture.asset('assets/svgs/slide-1.svg')

class _Slides extends StatefulWidget {


  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    // Voy a estar escuchando cuando cambie el Slider
    pageViewController.addListener(() {
      // print('Pag actual: ${pageViewController.page}');
      // Actualizar el providerm SliderModel
      // Actualizamos el curretPage
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page;
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
        children: [
          _Slide('assets/svgs/slide-1.svg'),
          _Slide('assets/svgs/slide-2.svg'),
          _Slide('assets/svgs/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}