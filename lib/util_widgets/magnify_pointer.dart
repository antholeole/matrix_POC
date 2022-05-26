import 'package:drag_demo/main.dart';
import 'package:flutter/material.dart';

class MagnifyPointer extends StatelessWidget {
  const MagnifyPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withAlpha(100),
      width: magnifyRegionSize.width,
      height: magnifyRegionSize.height,
    );
  }
}
