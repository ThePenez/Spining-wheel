import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SpinningWheelState extends Equatable {
  const SpinningWheelState({
    required this.angles,
    required this.heights,
    required this.widths,
  });
  final List<double> angles;
  final List<double> heights;
  final List<double> widths;

  @override
  List<Object> get props => [];
}

class StartState extends SpinningWheelState {
  const StartState({
    required this.angles,
    required this.heights,
    required this.widths,
  }) : super(angles: angles, heights: heights, widths: widths);
  // ignore: annotate_overrides, overridden_fields
  final List<double> angles;
  // ignore: annotate_overrides, overridden_fields
  final List<double> heights;
  // ignore: annotate_overrides, overridden_fields
  final List<double> widths;

  @override
  List<Object> get props => [angles];
  @override
  String toString() =>
      'Starting state { angles: $angles, heights: $heights, widths: $widths}';
}

class RotatedState extends SpinningWheelState {
  const RotatedState({
    required this.angles,
    required this.heights,
    required this.widths,
  }) : super(angles: angles, heights: heights, widths: widths);
  // ignore: annotate_overrides, overridden_fields
  final List<double> angles;
  // ignore: annotate_overrides, overridden_fields
  final List<double> heights;
  // ignore: annotate_overrides, overridden_fields
  final List<double> widths;

  @override
  List<Object> get props => [angles];
  @override
  String toString() =>
      'Rotated state { angles: $angles, heights: $heights, widths: $widths }';
}

class EnlargedState extends SpinningWheelState {
  const EnlargedState({
    required this.angles,
    required this.heights,
    required this.widths,
  }) : super(angles: angles, heights: heights, widths: widths);
  // ignore: annotate_overrides, overridden_fields
  final List<double> angles;
  // ignore: annotate_overrides, overridden_fields
  final List<double> heights;
  // ignore: annotate_overrides, overridden_fields
  final List<double> widths;

  @override
  List<Object> get props => [angles];
  @override
  String toString() =>
      'Enlarged state { angles: $angles, heights: $heights, widths: $widths }';
}

class SpinningWheelCubit extends Cubit<SpinningWheelState> {
  SpinningWheelCubit()
      : super(
          StartState(
            angles: List.filled(8, 0),
            heights: List.filled(8, double.maxFinite),
            widths: List.filled(8, 280),
          ),
        );

  final List<double> _angles = List.filled(8, 0);
  List<double> get angles => _angles;

  final List<double> _heights = List.filled(8, double.maxFinite);
  List<double> get heights => _heights;

  final List<double> _widths = List.filled(8, 280);
  List<double> get widths => _widths;

  void rotateIn(int itemIndex) {
    angles[itemIndex] = pi / 2;
    emit(RotatedState(angles: angles, heights: heights, widths: widths));
  }

  void zoomIn(int itemIndex) {
    angles[itemIndex] = pi / 2;
    heights[itemIndex] = double.maxFinite;
    widths[itemIndex] = double.maxFinite;
    emit(EnlargedState(angles: angles, heights: heights, widths: widths));
  }

  void zoomOut(int itemIndex) {
    angles[itemIndex] = pi / 2;
    heights[itemIndex] = double.maxFinite;
    widths[itemIndex] = 280;
    emit(RotatedState(angles: angles, heights: heights, widths: widths));
  }

  void rotateOut(int itemIndex) {
    angles[itemIndex] = 0;
    emit(StartState(angles: angles, heights: heights, widths: widths));
  }
}
