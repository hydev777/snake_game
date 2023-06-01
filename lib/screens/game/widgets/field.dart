import 'package:flutter/material.dart';

import '../classes/apple.dart';
import '../classes/snake_node.dart';

class Field extends CustomPainter {
  List<SnakeNode>? snake;
  Apple? apple;

  Field({this.snake, this.apple});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      apple!.location!,
      5,
      Paint()
        ..color = Colors.red
        ..strokeWidth = 4,
    );

    for (final node in snake!) {
      canvas.drawLine(
        node.location![0],
        node.location![1],
        Paint()
          ..color = Colors.black
          ..strokeWidth = 10,
      );
    }
  }

  @override
  bool shouldRepaint(Field oldDelegate) => false;
}
