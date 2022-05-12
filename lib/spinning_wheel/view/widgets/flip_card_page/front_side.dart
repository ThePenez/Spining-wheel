import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:spinning_wheel/spinning_wheel/view/widgets/carousel.dart';
import 'package:spinning_wheel/spinning_wheel/view/widgets/header_layout.dart';

class FrontSide extends StatelessWidget {
  const FrontSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/pozadina1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Carousel(),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: HeaderLayout(),
          ),
        ],
      ),
    );
  }
}
