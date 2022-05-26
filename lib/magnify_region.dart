import 'package:drag_demo/cubit/magnification_cubit.dart';
import 'package:drag_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:ui' as ui;

final GlobalKey previewContainer = GlobalKey();

class MagnifyInterior extends StatelessWidget {
  const MagnifyInterior({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MagnificationCubit, MagnificationState>(
      listener: (context, state) =>
          state.on(onPosition: (_) => _updateRenderBox(context)),
      child: RepaintBoundary(
        key: previewContainer,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          width: loupeSize.width,
          height: loupeSize.height,
        ),
      ),
    );
  }

  Future<void> _updateRenderBox(BuildContext context) async {
    RenderRepaintBoundary? boundary = previewContainer.currentContext!
        .findRenderObject() as RenderRepaintBoundary?;

    if (boundary == null) {
      return;
    }

    context
        .read<MagnificationCubit>()
        .addRepaintImage(await boundary.toImage());
  }
}
