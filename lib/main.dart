import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:snake_game/views/game.dart';

import 'provider/snake.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
