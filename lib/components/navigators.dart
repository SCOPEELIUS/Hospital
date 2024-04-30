import 'package:flutter/material.dart';
import 'package:hospital/components/indicators.dart';

void simpleNavigator(BuildContext context, Widget page) {
   showCustomSnackBar(context, "Welcome");
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(microseconds: 30),
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
    ),
  );
}
