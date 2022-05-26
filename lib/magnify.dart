import 'package:drag_demo/main.dart';
import 'package:flutter/material.dart';

class Magnify extends StatelessWidget {
  const Magnify({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: loupeSize.width,
      height: loupeSize.height,
      color: Colors.pink.withAlpha(100),
    );
  }
}
