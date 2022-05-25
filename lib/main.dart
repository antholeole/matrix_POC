import 'package:drag_demo/bee_movie.dart';
import 'package:flutter/material.dart';
import 'package:magnifier/magnifier.dart';

const loupeSize = Size(200, 200);

void main() {
  runApp(const Directionality(
    textDirection: TextDirection.ltr,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset loupePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FollowPointer(
          onPointerMove: (pointerPos) => setState(() {
                loupePosition = Offset(pointerPos.dx - (loupeSize.width / 2),
                    pointerPos.dy - (loupeSize.height / 2));
              }),
          child: const LoremIpsum()),
      Positioned(
        top: loupePosition.dy,
        left: loupePosition.dx,
        child: const Magnify(size: loupeSize),
      )
    ]);
  }
}

class Magnify extends StatelessWidget {
  final Size size;

  const Magnify({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.pink,
    );
  }
}

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

class LoremIpsum extends StatelessWidget {
  const LoremIpsum({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Text(
          beeMovie,
          style: TextStyle(color: Colors.black),
        ));
  }
}
