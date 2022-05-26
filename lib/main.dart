import 'package:drag_demo/magnify_region.dart';
import 'package:drag_demo/util_widgets/bee_movie.dart';
import 'package:drag_demo/cubit/magnification_cubit.dart';
import 'package:drag_demo/util_widgets/magnify_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'util_widgets/follow_pointer.dart';

//around a 4x zoom
const zoom = 4.0;
const unit = 50.0;
const loupeSize = Size(zoom * unit, zoom * unit);
const magnifyRegionSize = Size(unit, unit);
final wholeAppKeyRepaintBoundry = GlobalKey();

void main() {
  runApp(WidgetsApp(
    builder: (context, __) => BlocProvider(
        create: (_) => MagnificationCubit(
              wholeAppRepaintBoundry: wholeAppKeyRepaintBoundry,
              initalMagnificationPosition: Offset(
                  (MediaQuery.of(context).size.width / 2) -
                      (loupeSize.height / 2),
                  (MediaQuery.of(context).size.height / 2) -
                      (loupeSize.width / 2)),
            ),
        child: const MyApp()),
    color: Colors.white,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final magnificationPosition =
        context.watch<MagnificationCubit>().state.magnificationPosition;

    return Stack(children: [
      FollowPointer(
          onPointerMove: context.read<MagnificationCubit>().updatePosition,
          child: RepaintBoundary(
              key: wholeAppKeyRepaintBoundry, child: const LoremIpsum())),
      Positioned(
        top: magnificationPosition.dy -
            loupeSize.height -
            (magnifyRegionSize.height),
        left: magnificationPosition.dx - (loupeSize.width / 2),
        child: const MagnifyDisplay(),
      ),
      Positioned(
        top: magnificationPosition.dy - (magnifyRegionSize.height / 2),
        left: magnificationPosition.dx - (magnifyRegionSize.width / 2),
        child: const MagnifyPointer(),
      ),
    ]);
  }
}
