import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hero_location_ui/model/location.dart';
import 'package:hero_location_ui/page/detail_page.dart';
import 'package:hero_location_ui/widget/expanded_content_widget.dart';
import 'package:hero_location_ui/widget/image_widget.dart';

class LocationWidget extends StatefulWidget {
  final Location location;

  const LocationWidget({
    @required this.location,
    Key key,
  }) : super(key: key);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: isExpanded ? 40 : 100,
            width: isExpanded ? size.width * 0.78 : size.width * 0.7,
            height: isExpanded ? size.height * 0.6 : size.height * 0.5,
            child: ExpandedContentWidget(location: widget.location),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: isExpanded ? 150 : 100,
            child: GestureDetector(
              // detectamos cuando deslizamos con el dedo para abajo o arriba
              onPanUpdate: onPanUpdate,
              // cuando hacemos click en la imagen.
              onTap: openDetailPage,
              child: ImageWidget(location: widget.location),
            ),
          ),
        ],
      ),
    );
  }

  void openDetailPage() {
    // activamos la expancion.
    if (!isExpanded) {
      /// Tap to expand card
      setState(() => isExpanded = true);
      return;
    }

    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        reverseTransitionDuration: Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          // creamos la animacion que queremos que tenga cuando se navege
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Interval(0, 0.5),
          );

          // le damos una trancision de FadeIn y FadeOut
          return FadeTransition(
            opacity: curvedAnimation,
            child: DetailPage(location: widget.location, animation: animation),
          );
        },
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    // deslizamos para arriba con el dedo
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    // deslizamos para abajo con el dedo.
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
