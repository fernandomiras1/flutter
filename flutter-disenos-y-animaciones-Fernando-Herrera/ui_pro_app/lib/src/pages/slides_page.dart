import 'package:flutter/material.dart';
import 'package:ui_pro_app/src/widgets/slides_show.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SlidesPage extends StatelessWidget {
// SvgPicture.asset
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidesShow(
        puntosArriba: true,
        bulletPrimario: 15,
        bulletSecundario: 12,
        colorPrimario: Colors.red,
        colorSecundario: Colors.purple,
        slides: [
          SvgPicture.asset('assets/svgs/slide-1.svg'),
          SvgPicture.asset('assets/svgs/slide-2.svg'),
          SvgPicture.asset('assets/svgs/slide-3.svg'),
          SvgPicture.asset('assets/svgs/slide-4.svg'),
          // SvgPicture.asset('assets/svgs/slide-5.svg'),
        ]
      )
   );
  }
}
