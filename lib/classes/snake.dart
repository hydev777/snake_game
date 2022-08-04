import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../provider/snake_provider.dart';

class Snake with ChangeNotifier {
  List<SnakeNode>? body = [];
  Direction? _direction;
  Apple? _apple;

  Apple? get apple {

    return _apple;

  }

  Direction? get currentDirection {
    return _direction;
  }

  set direction(Direction direction) {
    _direction = direction;
  }

  Snake()
      : body = [
          SnakeNode(
            direction: Direction.right,
            location: [
              const Offset(40, 30),
              const Offset(50, 30),
            ],
          ),
        ],
        _direction = Direction.right,
        _apple = Apple(
          location: const Offset(40, 70),
        );

  forward() {
    SnakeNode head = body!.last;
    // print({head.direction, head.location});

    switch (head.direction) {
      case Direction.left:
        SnakeNode nextNode;
        // print("LEFT");
        if (_direction == Direction.down) {
          nextNode = SnakeNode(
              direction: Direction.down,
              location: [Offset(head.location![1].dx + 4, head.location![1].dy + 4), Offset(head.location![1].dx + 4, head.location![1].dy + 10)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(
              direction: Direction.up,
              location: [Offset(head.location![1].dx + 4, head.location![1].dy + 4), Offset(head.location![1].dx + 4, head.location![1].dy - 10)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [head.location![1], Offset(head.location![1].dx - 10, head.location![1].dy)]);
          body!.add(nextNode);
        }

        checkApple();

        body!.removeAt(0);

        notifyListeners();
        break;
      case Direction.right:
        SnakeNode nextNode;
        // print("RIGHT");
        if (_direction == Direction.down) {
          nextNode = SnakeNode(
              direction: Direction.down,
              location: [Offset(head.location![1].dx - 4, head.location![1].dy - 4), Offset(head.location![1].dx - 4, head.location![1].dy + 10)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(
              direction: Direction.up,
              location: [Offset(head.location![1].dx - 4, head.location![1].dy - 4), Offset(head.location![1].dx - 4, head.location![1].dy - 10)]);
          body!.add(nextNode);
        } else if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [head.location![1], Offset(head.location![1].dx + 10, head.location![1].dy)]);
          body!.add(nextNode);
        }

        checkApple();

        body!.removeAt(0);

        notifyListeners();
        break;
      case Direction.up:
        SnakeNode nextNode;
        // print("UP");
        if (_direction == Direction.right) {
          nextNode = SnakeNode(
              direction: Direction.right,
              location: [Offset(head.location![1].dx + 4, head.location![1].dy + 4), Offset(head.location![1].dx + 10, head.location![1].dy + 4)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(
              direction: Direction.left,
              location: [Offset(head.location![1].dx + 4, head.location![1].dy + 4), Offset(head.location![1].dx - 10, head.location![1].dy + 4)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy - 10)]);
          body!.add(nextNode);
        }

        checkApple();

        body!.removeAt(0);

        notifyListeners();
        break;
      case Direction.down:
        SnakeNode nextNode;
        // print("DOWN");
        if (_direction == Direction.right) {
          nextNode = SnakeNode(
              direction: Direction.right,
              location: [Offset(head.location![1].dx - 4, head.location![1].dy - 4), Offset(head.location![1].dx + 10, head.location![1].dy - 4)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(
              direction: Direction.left,
              location: [Offset(head.location![1].dx - 4, head.location![1].dy - 4), Offset(head.location![1].dx - 10, head.location![1].dy - 4)]);
          body!.add(nextNode);
        } else if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy + 10)]);
          body!.add(nextNode);
        }

        checkApple();

        body!.removeAt(0);

        notifyListeners();
        break;
      default:
        break;
    }
  }

  checkApple() {

    Offset snakeHeadTop = body!.last.location![1];

    print({ snakeHeadTop, _apple!.location });

    double xRange1 = _apple!.location!.dx;
    double xRange2 = _apple!.location!.dx + 7;

    double xRange3 =  _apple!.location!.dy;
    double xRange4 =  _apple!.location!.dy - 7;

    double yRange1 = _apple!.location!.dy;
    double yRange2 = _apple!.location!.dy - 7;

    double yRange3 =  _apple!.location!.dy;
    double yRange4 =  _apple!.location!.dy + 7;


    if(((snakeHeadTop.dx <= xRange2 && snakeHeadTop.dx >= xRange1) && (snakeHeadTop.dy <= yRange1 && snakeHeadTop.dy >= yRange2)) ||
        ((snakeHeadTop.dx <= xRange2 && snakeHeadTop.dx >= xRange1) &&  (snakeHeadTop.dy >= yRange3 && snakeHeadTop.dy <= yRange4)) ||
        ((snakeHeadTop.dx <= xRange3 && snakeHeadTop.dx >= xRange4) &&  (snakeHeadTop.dy <= yRange1 && snakeHeadTop.dy >= yRange2)) ||
        ((snakeHeadTop.dx <= xRange3 && snakeHeadTop.dx >= xRange4) &&  (snakeHeadTop.dy >= yRange3 && snakeHeadTop.dy <= yRange4))
    ) {

      eat();
      randomLocation();
      notifyListeners();

    }

  }

  eat() {
    SnakeNode head = body!.last;

    switch (head.direction) {
      case Direction.left:
        SnakeNode nextNode;
        if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy + 20)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy - 20)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [head.location![1], Offset(head.location![1].dx - 20, head.location![1].dy)]);
          body!.add(nextNode);
        }

        notifyListeners();
        break;
      case Direction.right:
        SnakeNode nextNode;
        if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy + 20)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy - 20)]);
          body!.add(nextNode);
        } else if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [head.location![1], Offset(head.location![1].dx + 20, head.location![1].dy)]);
          body!.add(nextNode);
        }

        notifyListeners();
        break;
      case Direction.up:
        SnakeNode nextNode;
        if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [head.location![1], Offset(head.location![1].dx + 20, head.location![1].dy)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [head.location![1], Offset(head.location![1].dx - 20, head.location![1].dy)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy - 20)]);
          body!.add(nextNode);
        }

        notifyListeners();
        break;
      case Direction.down:
        SnakeNode nextNode;
        if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [head.location![1], Offset(head.location![1].dx + 20, head.location![1].dy)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [head.location![1], Offset(head.location![1].dx - 20, head.location![1].dy)]);
          body!.add(nextNode);
        } else if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy + 20)]);
          body!.add(nextNode);
        }

        notifyListeners();
        break;
      default:
        break;
    }
  }

  randomLocation() {

    Random random = Random();
    int x = random.nextInt(400);
    int y = random.nextInt(600);

    _apple = Apple( location: Offset( x.toDouble(), y.toDouble() ) );
    notifyListeners();

  }

}

class Apple {
  Offset? location;

  Apple({this.location});
}

class SnakeNode {
  Direction? direction;
  List<Offset>? location;

  SnakeNode({this.direction, this.location});
}
