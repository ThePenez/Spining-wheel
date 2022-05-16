import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinning_wheel/spinning_wheel/cubit/spinning_wheel_cubit.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _angles =
        context.select((SpinningWheelCubit cubit) => cubit.state.angles);
    final _heights =
        context.select((SpinningWheelCubit cubit) => cubit.state.heights);
    final _widths =
        context.select((SpinningWheelCubit cubit) => cubit.state.widths);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          final data = notification.metrics as FixedExtentMetrics;
          final itemIndex = data.itemIndex % 8;
          BlocProvider.of<SpinningWheelCubit>(context).rotateIn(itemIndex);
          // BlocProvider.of<SpinningWheelCubit>(context).zoomIn(itemIndex);
          // BlocProvider.of<SpinningWheelCubit>(context).zoomOut(itemIndex);
          // BlocProvider.of<SpinningWheelCubit>(context).rotateOut(itemIndex);
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
                    key: ValueKey('$index'),
                    transformAlignment: Alignment.center,
                    duration: const Duration(milliseconds: 2000),
                    height: _heights[index],
                    transform: Matrix4.rotationZ(_angles[index]),
                    curve: Curves.bounceOut,
                    width: _widths[index],
                    child: Image.asset(
                      'assets/cards/0${index + 1}.png',
                      fit: BoxFit.fill,
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
