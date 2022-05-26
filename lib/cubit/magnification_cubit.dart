import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'magnification_state.dart';

class MagnificationCubit extends Cubit<MagnificationState> {
  MagnificationCubit({required Offset initalMagnificationPosition})
      : super(NewPositionMagnificationState(initalMagnificationPosition));

  void updatePosition(Offset centerPosition) {
    emit(NewPositionMagnificationState(centerPosition));
  }

  void addRepaintImage(ui.Image image) {
    emit(GotPaintableImageMagnificationState(
        state.magnificationPosition, image));
  }
}
