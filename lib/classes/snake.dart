import 'package:flutter/cupertino.dart';

import '../provider/snake_provider.dart';

class Snake with ChangeNotifier {
  List<SnakeNode>? body = [];
  Direction? _direction;

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
              const Offset(40, 25),
              const Offset(50, 25),
            ],
          ),
        ],
  _direction = Direction.right;

  forward() {
    SnakeNode head = body!.last;
    print({head.direction, head.location});

    switch (head.direction) {
      case Direction.left:
        SnakeNode nextNode;
        print("LEFT");
        if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [Offset(head.location![1].dx + 4, head.location![1].dy + 4), Offset(head.location![1].dx + 4, head.location![1].dy + 15)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [Offset(head.location![1].dx + 4, head.location![1].dy + 4), Offset(head.location![1].dx + 4, head.location![1].dy - 5)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [head.location![1], Offset(head.location![1].dx - 10, head.location![1].dy)]);
          body!.add(nextNode);
        }

        body!.removeAt(0);

        notifyListeners();
        break;
      case Direction.right:
        SnakeNode nextNode;
        print("RIGHT");
        if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [Offset(head.location![1].dx - 4, head.location![1].dy - 4), Offset(head.location![1].dx - 4, head.location![1].dy + 5)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [Offset(head.location![1].dx - 4, head.location![1].dy - 4), Offset(head.location![1].dx - 4, head.location![1].dy - 15)]);
          body!.add(nextNode);
        } else if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [head.location![1], Offset(head.location![1].dx + 10, head.location![1].dy)]);
          body!.add(nextNode);
        }

        body!.removeAt(0);

        notifyListeners();
        break;
      case Direction.up:
        SnakeNode nextNode;
        print("UP");
        if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [Offset(head.location![1].dx + 4, head.location![1].dy + 4), Offset(head.location![1].dx + 15, head.location![1].dy + 4)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [Offset(head.location![1].dx + 4, head.location![1].dy + 4), Offset(head.location![1].dx - 5, head.location![1].dy + 4)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy - 10)]);
          body!.add(nextNode);
        }

        body!.removeAt(0);

        notifyListeners();
        break;
      case Direction.down:
        SnakeNode nextNode;
        print("DOWN");
        if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [Offset(head.location![1].dx - 4, head.location![1].dy - 4), Offset(head.location![1].dx + 5, head.location![1].dy - 4)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [Offset(head.location![1].dx - 4, head.location![1].dy - 4), Offset(head.location![1].dx - 15, head.location![1].dy - 4)]);
          body!.add(nextNode);
        } else if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy + 10)]);
          body!.add(nextNode);
        }

        body!.removeAt(0);

        notifyListeners();
        break;
      default:
        break;
    }
  }

  eat() {
    SnakeNode head = body!.last;
    print({head.direction, head.location});

    switch (head.direction) {
      case Direction.left:
        SnakeNode nextNode;
        print("LEFT");
        if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy + 10)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy - 10)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [head.location![1], Offset(head.location![1].dx - 10, head.location![1].dy)]);
          body!.add(nextNode);
        }

        notifyListeners();
        break;
      case Direction.right:
        SnakeNode nextNode;
        print("RIGHT");
        if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy + 10)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy - 10)]);
          body!.add(nextNode);
        } else if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [head.location![1], Offset(head.location![1].dx + 10, head.location![1].dy)]);
          body!.add(nextNode);
        }

        notifyListeners();
        break;
      case Direction.up:
        SnakeNode nextNode;
        print("UP");
        if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [head.location![1], Offset(head.location![1].dx + 10, head.location![1].dy)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [head.location![1], Offset(head.location![1].dx - 10, head.location![1].dy)]);
          body!.add(nextNode);
        } else if (_direction == Direction.up) {
          nextNode = SnakeNode(direction: Direction.up, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy - 10)]);
          body!.add(nextNode);
        }

        notifyListeners();
        break;
      case Direction.down:
        SnakeNode nextNode;
        print("DOWN");
        if (_direction == Direction.right) {
          nextNode = SnakeNode(direction: Direction.right, location: [head.location![1], Offset(head.location![1].dx + 10, head.location![1].dy)]);
          body!.add(nextNode);
        } else if (_direction == Direction.left) {
          nextNode = SnakeNode(direction: Direction.left, location: [head.location![1], Offset(head.location![1].dx - 10, head.location![1].dy)]);
          body!.add(nextNode);
        } else if (_direction == Direction.down) {
          nextNode = SnakeNode(direction: Direction.down, location: [head.location![1], Offset(head.location![1].dx, head.location![1].dy + 10)]);
          body!.add(nextNode);
        }

        notifyListeners();
        break;
      default:
        break;
    }
  }
}

class SnakeNode {
  Direction? direction;
  List<Offset>? location;

  SnakeNode({this.direction, this.location});
}
