import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinning_wheel/spinning_wheel/cubit/spinning_wheel_cubit.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _angles = context.select((SpinningWheelCubit cubit) => cubit.state);
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          //TODO: Add behaviour when the scrolling ends
          final data = notification.metrics as FixedExtentMetrics;
          var rotateIndex = data.itemIndex % 8;
          if (_angles[rotateIndex] == pi / 2) {
            context.read<SpinningWheelCubit>().rotateOut(rotateIndex);
          } else {
            context.read<SpinningWheelCubit>().rotateIn(rotateIndex);
          }
          return true;
        }
        return false;
      },
      child: ListWheelScrollView.useDelegate(
        itemExtent: 155,
        key: const PageStorageKey('wheelStateKey'),
        childDelegate: ListWheelChildLoopingListDelegate(
          children: List<Widget>.generate(
            8,
            (index) => Stack(
              children: [
                Center(
                  child: AnimatedContainer(
                    transformAlignment: Alignment.center,
                    duration: const Duration(milliseconds: 2000),
                    height: double.infinity,
                    transform: Matrix4.rotationZ(_angles[index]),
                    curve: Curves.bounceOut,
                    child: Image.asset(
                      'assets/cards/0${index + 1}.png',
                      fit: BoxFit.fill,
                      width: 280,
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/card_circles/0${index + 1}.png',
                  ),
                ),
              ],
            ),
          ),
        ),
        //controller: FixedExtentScrollController(),
        physics: const FixedExtentScrollPhysics(),
        //magnification: 1.8,
        perspective: 0.001,
        //useMagnifier: true,
        squeeze: 0.96,
        diameterRatio: 1.3,
        clipBehavior: Clip.antiAlias,
        //offAxisFraction: 0.5,
      ),
    );
  }
}
