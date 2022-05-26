import 'package:drag_demo/cubit/magnification_cubit.dart';
import 'package:drag_demo/main.dart';
import 'package:drag_demo/util_widgets/ui_image_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MagnifyDisplay extends StatelessWidget {
  const MagnifyDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: loupeSize.width,
      height: loupeSize.height,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: context.watch<MagnificationCubit>().state.on(
            onPaintable: (renderableRegion) => UIImage(
                image: renderableRegion.image,
                offset: renderableRegion.magnificationPosition),
          ),
    );
  }
}
