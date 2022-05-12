import 'dart:math';

import 'package:bloc/bloc.dart';

class SpinningWheelCubit extends Cubit<List<double>> {
  SpinningWheelCubit() : super(List.filled(8, 0));

  void rotateIn(int itemIndex) {
    state[itemIndex] = pi / 2;
    return emit(state);
  }

  void rotateOut(int itemIndex) {
    state[itemIndex] = 0;
    return emit(state);
  }
}
