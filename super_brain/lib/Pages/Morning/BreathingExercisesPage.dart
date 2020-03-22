import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_brain/Models/BrethingExercise.dart';
import 'package:super_brain/Translations.dart';
import 'package:super_brain/Widgets/TitleWidget.dart';

import 'package:http/http.dart' as http;

class BreathingExercisesPage extends StatefulWidget {
  BreathingExercisesPageState createState() => BreathingExercisesPageState();
}

class BreathingExercisesPageState extends State<BreathingExercisesPage> {
  List<BreathingExercise> _exercises = [];

  int _currentTime = 0;
  String _currentDescription = "Welcome to breathing exercises. The instructions for the exercises will scroll here while the timer show remaining time for current exercise. Press the \"start\" button to begin the exercises.";
  bool _exercisePlaying = false;

  Future fetchExercises() async {
    final response = await http.get(Translations.of(context).text("breathing_exercises_url"));

    if (response.statusCode == 200) {
      List<dynamic> httpExercise = json.decode(response.body);

      for (var exercise in httpExercise) {
        _exercises.add(BreathingExercise.fromJson(exercise));
      }
    } 
    else {
      throw Exception(Translations.of(context).text("breathing_exercises_failed_to_load"));
    }
  }

  _startExercise(int exerciceNumber) async {
    if (_exercises.isEmpty) {
      setState(() {
        _exercisePlaying = true;
      });

      await fetchExercises();
    }
    
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
    if (!_exercisePlaying) {
      _currentDescription = Translations.of(context).text("breathing_exercises_description");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("morning_title") + ">" + Translations.of(context).text("breathing_exercises_title")),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleWidget(title: Translations.of(context).text("breathing_exercises_title")),
            Expanded(
              flex: 4, 
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
              flex: 4, 
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
                      FlatButton(onPressed: _exercisePlaying ? null : () => {_startExercise(0)}, child: Text(Translations.of(context).text("start")), ),
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