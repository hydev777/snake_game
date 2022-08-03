import 'package:flutter/foundation.dart';
import 'package:snake_game/classes/snake.dart';

enum Direction { left, right, up, down }

class SnakeProvider with ChangeNotifier {

  Snake? snake = Snake();
  Direction direction = Direction.right;

}
