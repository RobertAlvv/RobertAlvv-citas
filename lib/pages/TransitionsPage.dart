import 'package:flutter/material.dart';

class createRoute {
  Widget page;
  double x, y;

  createRoute(this.page, this.x, this.y);

  Route createRoutemethod() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 1300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(x, y);
        var end = Offset.zero;
        var curve = Curves.linearToEaseOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route createScaleRouteMethod() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 275),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.ease,
            ),
          ),
          child: child,
        );
      },
    );
  }
}
