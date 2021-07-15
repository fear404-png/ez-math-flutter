import 'package:ez_math/pages/game_data.dart';
import 'package:ez_math/resource/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _GameBody(),
    );
  }
}

class _GameBody extends StatelessWidget {
  const _GameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          _HeadWidget(),
          _BottomWidget(),
        ],
      ),
    );
  }
}

class _HeadWidget extends StatelessWidget {
  const _HeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _ProgressBarWidget(
            type: "lvl",
            points: GameData.lvl,
          ),
          SizedBox(
            height: 10,
          ),
          _ProgressBarWidget(
            type: "hp",
            points: GameData.hp,
          ),
          SizedBox(
            height: 10,
          ),
          _PointsWidget(),
          SizedBox(
            height: 10,
          ),
          _TimeBarWidget(),
          SizedBox(
            height: 10,
          ),
          _TaskWidget(),
          SizedBox(
            height: 10,
          ),
          _AnswerWidget(),
        ],
      ),
    );
  }
}

class _ProgressBarWidget extends StatelessWidget {
  String _type;
  int _points;
  _ProgressBarWidget({Key? key, required String type, required int points})
      : _type = type,
        _points = points,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text("$_type: $_points",
            style: TextStyle(color: AppColors.accent)));
  }
}

class _PointsWidget extends StatelessWidget {
  const _PointsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("300",
            style: TextStyle(color: AppColors.accent, fontSize: 60)));
  }
}

class _TimeBarWidget extends StatelessWidget {
  _TimeBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocGame, GameData>(
        builder: (context, data) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "13.2",
                  style: TextStyle(fontSize: 20, color: AppColors.accent),
                ),
                Text(
                  GameData.curretTime.toString(),
                  style: TextStyle(fontSize: 30, color: AppColors.accent),
                ),
                Text(
                  "13.2",
                  style: TextStyle(fontSize: 20, color: AppColors.accent),
                ),
              ],
            ));
  }
}

class _TaskWidget extends StatelessWidget {
  const _TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.accent),
      ),
      child: Center(
        child: BlocBuilder<BlocGame, GameData>(
          builder: (context, task) => Text(
            GameData.task,
            style: TextStyle(fontSize: 30, color: AppColors.accent),
          ),
        ),
      ),
    );
  }
}

class _AnswerWidget extends StatelessWidget {
  const _AnswerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.accent),
      ),
      child: Center(
        child: BlocBuilder<BlocGame, GameData>(
          builder: (context, answer) => Text(
            GameData.userAnswer,
            style: TextStyle(fontSize: 30, color: AppColors.accent),
          ),
        ),
      ),
    );
  }
}

class _BottomWidget extends StatelessWidget {
  const _BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: _KeyboardWidget());
  }
}

class _KeyboardWidget extends StatelessWidget {
  const _KeyboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.one, buttonName: "1")),
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.two, buttonName: "2")),
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.three, buttonName: "3")),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.four, buttonName: "4")),
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.five, buttonName: "5")),
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.six, buttonName: "6")),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.seven, buttonName: "7")),
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.eight, buttonName: "8")),
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.nine, buttonName: "9")),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.next, buttonName: "NEXT")),
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.zero, buttonName: "0")),
              Expanded(
                  child: _ButtonWidget(
                      eventButton: EventButton.del, buttonName: "DEL")),
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  _ButtonWidget(
      {Key? key, required EventButton eventButton, required String buttonName})
      : _eventButton = eventButton,
        _buttonName = buttonName,
        super(key: key);
  EventButton _eventButton;
  String _buttonName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<BlocGame>(context).add(_eventButton);
        },
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: AppColors.accent)),
          child: Center(
            child: Text(
              "$_buttonName",
              style: TextStyle(color: AppColors.accent, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
