import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game/provider/snake.dart';
import '../game/view/game.dart';

class SnakeGame extends StatelessWidget {
  const SnakeGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => SnakeProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Game(),
      ),
    );
  }
}
