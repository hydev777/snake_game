import 'dart:ui';

import '../provider/snake.dart';

class SnakeNode {
  Direction? direction;
  List<Offset>? location;

  SnakeNode({this.direction, this.location});
}
