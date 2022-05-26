import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SpinningWheelState extends Equatable {
  const SpinningWheelState({
    required this.angles,
    required this.heights,
    required this.widths,
    required this.physics,
  });
  final List<double> angles;
  final List<double> heights;
  final List<double> widths;
  final ScrollPhysics physics;

  @override
  List<Object> get props => [];
}

class StartState extends SpinningWheelState {
  const StartState({
    required this.angles,
    required this.heights,
    required this.widths,
    required this.physics,
  }) : super(
          angles: angles,
          heights: heights,
          widths: widths,
          physics: physics,
        );
  // ignore: annotate_overrides, overridden_fields
  final List<double> angles;
  // ignore: annotate_overrides, overridden_fields
  final List<double> heights;
  // ignore: annotate_overrides, overridden_fields
  final List<double> widths;
  // ignore: annotate_overrides, overridden_fields
  final ScrollPhysics physics;

  @override
  List<Object> get props => [angles, heights, widths, physics];
  @override
  String toString() =>
      'Starting state { angles: $angles, heights: $heights, widths: $widths, physics: ${physics.toString()}}';
}

class RotatedState extends SpinningWheelState {
  const RotatedState({
    required this.angles,
    required this.heights,
    required this.widths,
    required this.physics,
  }) : super(
          angles: angles,
          heights: heights,
          widths: widths,
          physics: physics,
        );
  // ignore: annotate_overrides, overridden_fields
  final List<double> angles;
  // ignore: annotate_overrides, overridden_fields
  final List<double> heights;
  // ignore: annotate_overrides, overridden_fields
  final List<double> widths;
  // ignore: annotate_overrides, overridden_fields
  final ScrollPhysics physics;

  @override
  List<Object> get props => [angles, heights, widths, physics];

  @override
  String toString() =>
      'Rotated state { angles: $angles, heights: $heights, widths: $widths, physics: ${physics.toString()} }';
}

class EnlargedState extends SpinningWheelState {
  const EnlargedState({
    required this.angles,
    required this.heights,
    required this.widths,
    required this.physics,
  }) : super(
          angles: angles,
          heights: heights,
          widths: widths,
          physics: physics,
        );
  // ignore: annotate_overrides, overridden_fields
  final List<double> angles;
  // ignore: annotate_overrides, overridden_fields
  final List<double> heights;
  // ignore: annotate_overrides, overridden_fields
  final List<double> widths;
  // ignore: annotate_overrides, overridden_fields
  final ScrollPhysics physics;

  @override
  List<Object> get props => [angles, heights, widths, physics];

  @override
  String toString() =>
      'Enlarged state { angles: $angles, heights: $heights, widths: $widths, physics: ${physics.toString()} }';
}

class SpinningWheelCubit extends Cubit<SpinningWheelState> {
  SpinningWheelCubit()
      : super(
          StartState(
            angles: List.filled(8, 0),
            heights: List.filled(8, double.maxFinite),
            widths: List.filled(8, 280),
            physics: const FixedExtentScrollPhysics(),
          ),
        );

  final List<double> _angles = List.filled(8, 0);
  List<double> get angles => _angles;

  final List<double> _heights = List.filled(8, double.maxFinite);
  List<double> get heights => _heights;

  final List<double> _widths = List.filled(8, 280);
  List<double> get widths => _widths;

  ScrollPhysics physics = const FixedExtentScrollPhysics();

  void rotateIn(int itemIndex) {
    if (state is StartState) {
      angles[itemIndex] = pi / 2;
      physics = const NeverScrollableScrollPhysics();
      emit(
        RotatedState(
          angles: angles,
          heights: heights,
          widths: widths,
          physics: physics,
        ),
      );
    }
  }

  void zoomIn(int itemIndex) {
    if (state is RotatedState) {
      heights[itemIndex] = double.maxFinite;
      widths[itemIndex] = double.maxFinite;
      emit(
        EnlargedState(
          angles: angles,
          heights: heights,
          widths: widths,
          physics: physics,
        ),
      );
    }
  }

  void zoomOut(int itemIndex) {
    if (state is EnlargedState) {
      widths[itemIndex] = 280;
      physics = const FixedExtentScrollPhysics();
      emit(
        RotatedState(
          angles: angles,
          heights: heights,
          widths: widths,
          physics: physics,
        ),
      );
    }
  }

  void rotateOut(int itemIndex) {
    if (state is RotatedState) {
      angles[itemIndex] = 0;
      emit(
        StartState(
          angles: angles,
          heights: heights,
          widths: widths,
          physics: physics,
        ),
      );
    }
  }
}
