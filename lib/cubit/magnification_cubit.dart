import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'magnification_state.dart';

class MagnificationCubit extends Cubit<MagnificationState> {
  final GlobalKey wholeAppRepaintBoundry;

  MagnificationCubit(
      {required Offset initalMagnificationPosition,
      required this.wholeAppRepaintBoundry})
      : super(NewPositionMagnificationState(initalMagnificationPosition));

  Future<void> updatePosition(Offset centerPosition) async {
    emit(NewPositionMagnificationState(centerPosition));

    RenderRepaintBoundary? boundary = wholeAppRepaintBoundry.currentContext!
        .findRenderObject() as RenderRepaintBoundary?;

    if (boundary == null) {
      return;
    }

    final image = await boundary.toImage();
    emit(GotPaintableImageMagnificationState(
        state.magnificationPosition, image));
  }
}
