import 'dart:async';
import 'dart:math';

import 'package:ez_math/pages/bloc_game.dart';
import 'package:ez_math/pages/game_data.dart';

class GameLogic {
  static Random _r = Random();
  static int _timeCount = 20000;
  static late Timer _timer;

  static bool isAnswerTrue() {
    bool isTrue = false;
    GameData.userAnswer == GameData.trueAnswer ? isTrue = true : isTrue = false;
    return isTrue;
  }

  static void generateNewTask() {
    int _num1 = _r.nextInt(10) + 1 * GameData.lvl;
    int _num2 = _r.nextInt(10) + 1 * GameData.lvl;
    int _answer = _num1 + _num2;
    GameData.trueAnswer = "$_answer";
    GameData.userAnswer = "";
    GameData.task = "$_num1 + $_num2";
  }

  static void startTimer() {
    _timeCount = 20000;
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _timeCount > 0 ? _timeCount -= 10 : _timer.cancel();
      GameData.curretTime = _timeCount / 1000;
      BlocGame(GameData()).stream;
    });
  }
}
