import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_data.dart';
import 'game_logic.dart';

enum EventButton {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  next,
  del
}

class BlocGame extends Bloc<EventButton, GameData> {
  BlocGame(GameData initialState) : super(initialState);

  @override
  Stream<GameData> mapEventToState(EventButton event) async* {
    // TODO: implement mapEventToState

    if (GameData.userAnswer.length >= 20) {
      return;
    }

    switch (event) {
      case EventButton.zero:
        GameData.userAnswer += "0";
        break;
      case EventButton.one:
        GameData.userAnswer += "1";
        break;
      case EventButton.two:
        GameData.userAnswer += "2";
        break;
      case EventButton.three:
        GameData.userAnswer += "3";
        break;
      case EventButton.four:
        GameData.userAnswer += "4";
        break;
      case EventButton.five:
        GameData.userAnswer += "5";
        break;
      case EventButton.six:
        GameData.userAnswer += "6";
        break;
      case EventButton.seven:
        GameData.userAnswer += "7";
        break;
      case EventButton.eight:
        GameData.userAnswer += "8";
        break;
      case EventButton.nine:
        GameData.userAnswer += "9";
        break;
      case EventButton.next:
        GameData.userAnswer += "9";
        break;
      case EventButton.del:
        if (GameData.userAnswer != null && GameData.userAnswer.length > 0) {
          GameData.userAnswer =
              GameData.userAnswer.substring(0, GameData.userAnswer.length - 1);
        }

        break;
    }

    if (GameLogic.isAnswerTrue()) {
      GameLogic.generateNewTask();
      GameLogic.startTimer();
    }

    yield GameData();
  }
}
