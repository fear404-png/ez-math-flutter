import 'package:ez_math/resource/app_colors.dart';
import 'package:flutter/material.dart';

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
          _ProgressBarWidget(),
          SizedBox(
            height: 10,
          ),
          _ProgressBarWidget(),
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
  const _ProgressBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(border: Border.all(color: AppColors.accent)),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "lvl",
            style: TextStyle(color: AppColors.accent),
          ),
          SizedBox(
            width: 10,
          ),
          AnimatedContainer(
            width: 50,
            height: 23,
            duration: Duration(milliseconds: 400),
            color: AppColors.accent,
            curve: Curves.fastOutSlowIn,
          ),
          Expanded(child: Container()),
        ],
      ),
    );
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
  const _TimeBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "13.2",
          style: TextStyle(fontSize: 20, color: AppColors.accent),
        ),
        Text(
          "13.2",
          style: TextStyle(fontSize: 30, color: AppColors.accent),
        ),
        Text(
          "13.2",
          style: TextStyle(fontSize: 20, color: AppColors.accent),
        ),
      ],
    );
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
        child: Text(
          "144 + 18234812",
          style: TextStyle(fontSize: 30, color: AppColors.accent),
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
        child: Text(
          "12321321",
          style: TextStyle(fontSize: 30, color: AppColors.accent),
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
              Expanded(child: _ButtonWidget()),
              Expanded(child: _ButtonWidget()),
              Expanded(child: _ButtonWidget()),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(child: _ButtonWidget()),
              Expanded(child: _ButtonWidget()),
              Expanded(child: _ButtonWidget()),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(child: _ButtonWidget()),
              Expanded(child: _ButtonWidget()),
              Expanded(child: _ButtonWidget()),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(child: _ButtonWidget()),
              Expanded(child: _ButtonWidget()),
              Expanded(child: _ButtonWidget()),
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: AppColors.accent)),
        child: Center(
          child: Text(
            "btn",
            style: TextStyle(color: AppColors.accent, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
