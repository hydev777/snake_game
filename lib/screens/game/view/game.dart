import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arrow_pad/arrow_pad.dart';

import '../../../widgets/field.dart';
import '../classes/apple.dart';
import '../classes/snake_node.dart';
import '../provider/snake.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      context.read<SnakeProvider>().forward();
      // Provider.of<SnakeProvider>(context, listen: false).forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final snakeAction = context.read<SnakeProvider>();
    Direction currentDirection =
        context.watch<SnakeProvider>().currentDirection!;
    List<SnakeNode>? snake = context.watch<SnakeProvider>().snake;
    Apple? apple = context.watch<SnakeProvider>().apple;
    int score = context.watch<SnakeProvider>().currentScore;

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
                  border: Border.all(
                    width: 4,
                    color: Colors.black,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Align(
                  child: Text(
                    score.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
            if (currentDirection != Direction.down) {
              snakeAction.direction = Direction.up;
            }
          },
          onPressedDown: () {
            if (currentDirection != Direction.up) {
              snakeAction.direction = Direction.down;
            }
          },
          onPressedLeft: () {
            if (currentDirection != Direction.right) {
              snakeAction.direction = Direction.left;
            }
          },
          onPressedRight: () {
            if (currentDirection != Direction.left) {
              snakeAction.direction = Direction.right;
            }
          },
        ),
      ),
    );
  }
}
