import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_game/classes/snake.dart';
import 'package:arrow_pad/arrow_pad.dart';
import 'package:snake_game/provider/snake_provider.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final String _secondArrowPadValue = 'With Functions';

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      Provider.of<Snake>(context, listen: false).forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final snake = Provider.of<Snake>(context);
    final snakeBody = Provider.of<Snake>(context).body;
    final apple = Provider.of<Snake>(context).apple;

    return SafeArea(
      child: Scaffold(
        body: CustomPaint(
          painter: Field(snake: snakeBody, apple: apple),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Align(
              child: Text(_secondArrowPadValue),
              alignment: Alignment.bottomLeft,
            ),
          ),
        ),
        floatingActionButton: ArrowPad(
          padding: const EdgeInsets.all(8.0),
          height: 100,
          width: 100,
          iconColor: Colors.white,
          innerColor: Colors.red,
          outerColor: const Color(0xFFCC0000),
          splashColor: const Color(0xFFCC0000),
          hoverColor: const Color(0xFFFF4D4D),
          onPressedUp: () {
            if (snake.currentDirection != Direction.down) {
              snake.direction = Direction.up;
            }
          },
          onPressedDown: () {
            if (snake.currentDirection != Direction.up) {
              snake.direction = Direction.down;
            }
          },
          onPressedLeft: () {
            if (snake.currentDirection != Direction.right) {
              snake.direction = Direction.left;
            }
          },
          onPressedRight: () {
            if (snake.currentDirection != Direction.left) {
              snake.direction = Direction.right;
            }
          },
        ),
      ),
    );
  }
}

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
          ..strokeWidth = 4);

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
