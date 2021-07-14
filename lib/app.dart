import 'package:ez_math/pages/game_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/game_screen": (context) => GameScreen()},
      initialRoute: "/game_screen",
    );
  }
}