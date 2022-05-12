import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//Enables scrolling via vertical drag in web application
class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
