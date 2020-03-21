import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_brain/Models/BrethingExercise.dart';
import 'package:super_brain/Widgets/CardButton.dart';
import 'package:super_brain/Widgets/TipWidget.dart';
import 'package:super_brain/Widgets/TitleWidget.dart';

class BreathingExercisesPage extends StatefulWidget {
  BreathingExercisesPageState createState() => BreathingExercisesPageState();
}

class BreathingExercisesPageState extends State<BreathingExercisesPage> {
  List<BreathingExercise> _exercises = [
    BreathingExercise(duration: 60, description: "Respire bien pendant 1 minute..."),
    BreathingExercise(duration: 30, description: "Respire bien pendant 30 secondes..."),
    BreathingExercise(duration: 90, description: "Respire bien pendant 1 minute et 30 secondes..."),
  ];

  int _currentTime = 0;
  String _currentDescription = "Welcome to breathing exercises. The instructions for the exercises will scroll here while the timer show remaining time for current exercise. Press the \"start\" button to begin the exercises.";
  bool _exercisePlaying = false;

  _startExercise(int exerciceNumber) {
    _currentTime = _exercises[exerciceNumber].duration;
    _currentDescription = _exercises[exerciceNumber].description;

    Timer.periodic(Duration(seconds: 1), (Timer timer) => setState(() {
      if (_currentTime < 1) {
        timer.cancel();

        _currentTime = 0;
        if (exerciceNumber < _exercises.length - 1) {
          _startExercise(exerciceNumber + 1);
        }
        else {
          _exercisePlaying = false;
        }
      }
      else {
        _exercisePlaying = true;
        _currentTime = _currentTime - 1;
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Morning > Breathing Exercises"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleWidget(title: "Morning Breathing Exercises"),
            Expanded(
              flex: 3, 
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/women_mediting.svg',
                            semanticsLabel: "Woman Mediting",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5, 
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(_currentDescription),
                        ),
                      ),
                      FlatButton(onPressed: _exercisePlaying ? null : () => {_startExercise(0)}, child: Text("Start"), ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text("${_currentTime ~/ 60}:${_currentTime % 60}", style: Theme.of(context).textTheme.headline),
            ),
          ],
        )
      ),
    );
  }
}