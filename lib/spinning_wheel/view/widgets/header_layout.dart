import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spinning_wheel/counter/counter.dart';

class HeaderLayout extends StatelessWidget {
  const HeaderLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: PlatformIconButton(
            onPressed: () {
              Navigator.push<MaterialPageRoute>(
                context,
                PageTransition(
                  child: const CounterPage(),
                  type: PageTransitionType.leftToRight,
                  curve: Curves.elasticOut,
                ),
              );
            },
            cupertinoIcon: Container(
              padding: const EdgeInsets.only(top: 30),
              child: const Icon(
                CupertinoIcons.info,
                color: Colors.white,
              ),
            ),
            materialIcon: Container(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 36,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
