import 'package:ez_math/pages/bloc_game.dart';

import 'package:ez_math/pages/game_data.dart';
import 'package:ez_math/pages/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/game_screen": (context) => BlocProvider(
              create: (context) => BlocGame(GameData()),
              child: GameScreen(),
            )
      },
      initialRoute: "/game_screen",
    );
  }
}
