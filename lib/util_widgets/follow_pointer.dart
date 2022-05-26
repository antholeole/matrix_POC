import 'package:flutter/material.dart';

class FollowPointer extends StatelessWidget {
  final Widget child;
  final void Function(Offset newPosition) onPointerMove;

  const FollowPointer(
      {super.key, required this.onPointerMove, required this.child});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (event) => onPointerMove(event.position),
      onPointerUp: (event) => onPointerMove(event.position),
      onPointerDown: (event) => onPointerMove(event.position),
      child: child,
    );
  }
}
