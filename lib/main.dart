import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:snake_game/views/game.dart';

import 'classes/snake.dart';

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
          create: (ctx) => Snake(),
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
