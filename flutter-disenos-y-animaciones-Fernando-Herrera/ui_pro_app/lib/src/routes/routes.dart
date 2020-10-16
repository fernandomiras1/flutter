import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ui_pro_app/src/pages/animaciones_page.dart';
import 'package:ui_pro_app/src/pages/graficas_circulares_page.dart';
import 'package:ui_pro_app/src/pages/headers_page.dart';
import 'package:ui_pro_app/src/pages/list_animated_page.dart';
import 'package:ui_pro_app/src/pages/scroll_header.dart';
import 'package:ui_pro_app/src/pages/slides_page.dart';
import 'package:ui_pro_app/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slides Show', SlidesPage()),
  _Route(FontAwesomeIcons.ambulance, 'List Animated', ListAnimatedPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', CuadradoAnimado()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra Progreso', GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', ScrollHeaderPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers List', SliverListPage()),
];


class _Route {

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);


}