import 'package:animated_text_kit/animated_text_kit.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackSide extends StatelessWidget {
  const BackSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/pozadina.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white,
          child: TextLiquidFill(
            text: 'Pravila igre',
            boxHeight: 150,
            boxWidth: 300,
            loadUntil: 0.5,
            loadDuration: const Duration(milliseconds: 1500),
            waveColor: Colors.yellow,
            boxBackgroundColor: const Color(0xff007f5f),
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
