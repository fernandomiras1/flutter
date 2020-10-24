part of 'helpers.dart';

Route navegarMapaFadeIn(BuildContext context, Widget page) {

  return PageRouteBuilder(
    pageBuilder: (_,__,___) => page,
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, _, child) {
      return FadeTransition(
        child: child,
        // compienza traspartenmte y termina fuernte
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut)
        )
      );
    }

  );
}