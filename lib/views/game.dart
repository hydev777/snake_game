import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_game/provider/snake.dart';
import 'package:arrow_pad/arrow_pad.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      Provider.of<SnakeProvider>(context, listen: false).forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final snakeAction = Provider.of<SnakeProvider>(context);
    final snake = Provider.of<SnakeProvider>(context).snake;
    final apple = Provider.of<SnakeProvider>(context).apple;
    int score = Provider.of<SnakeProvider>(context).currentScore;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ClipRect(
            child: CustomPaint(
              painter: Field(snake: snake, apple: apple),
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.black)
                ),
                padding: const EdgeInsets.all(10),
                child: Align(
                  child: Text(score.toString(), style: const TextStyle( color: Colors.red, fontSize: 80, fontWeight: FontWeight.bold )),
                  alignment: Alignment.bottomLeft,
                ),
              ),
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
            if (snakeAction.currentDirection != Direction.down) {
              snakeAction.direction = Direction.up;
            }
          },
          onPressedDown: () {
            if (snakeAction.currentDirection != Direction.up) {
              snakeAction.direction = Direction.down;
            }
          },
          onPressedLeft: () {
            if (snakeAction.currentDirection != Direction.right) {
              snakeAction.direction = Direction.left;
            }
          },
          onPressedRight: () {
            if (snakeAction.currentDirection != Direction.left) {
              snakeAction.direction = Direction.right;
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
