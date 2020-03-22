import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_brain/Models/TrainingExercise.dart';
import 'package:super_brain/Widgets/TitleWidget.dart';

class MorningTrainingPage extends StatefulWidget {
 MorningTrainingPageState createState() => MorningTrainingPageState(); 
}

class MorningTrainingPageState extends State<MorningTrainingPage> {
  bool _currentlyTraining = false;
  
  int _currentTime = 0;
  String _currentTitle = "A Simple Exercice";
  String _currentDescription = "Welcome to you morning training. How are you today? When you're ready, choose the time of the session and start by pressing one of the button below.";

  List<TrainingExercise> _trainingExercises = [
    TrainingExercise(imageTitle: "high_knee", title: "High Knees", description: "Montez rapidement les genoux en course."),
    TrainingExercise(imageTitle: "squats", title: "Squats", description: "Décendez sur vos jambes en gardant le dos bien droit et sans décoller les talons."),
    TrainingExercise(imageTitle: "lunges", title: "Lunges", description: "Avancé sur une jambe et fléchissez là, puis faites de même avec l'autre"),
    TrainingExercise(imageTitle: "sit_ups", title: "Sit Ups", description: "Mettez vous sur le dos avec les jambes légèrement fléchis, puis levez le dos sans décoller les pieds."),
  ];
  List<int> _playedExercisesIndex = [];

  _playExercises(int remainingExercises) {
    if (remainingExercises > 0) {
      final _random = new Random();

      int exerciseIndex = 0;
      do {
        exerciseIndex = _random.nextInt(_trainingExercises.length);
      } while (_playedExercisesIndex.contains(exerciseIndex));

      _playedExercisesIndex.add(exerciseIndex);
      _currentTitle = _trainingExercises[exerciseIndex].title;
      _currentDescription = _trainingExercises[exerciseIndex].description;
      _currentTime = 30;

      Timer.periodic(Duration(seconds: 1), (Timer timer) => setState(() {
        if (_currentTime < 1) {
          timer.cancel();
          _currentTime = 0;

          if (remainingExercises > 1) {
            _runPause(remainingExercises - 1);
          }
          else {
            _currentlyTraining = false;
            _currentDescription = "Welcome to you morning training. How are you today? When you're ready, choose the time of the session and start by pressing one of the button below.";
            _playedExercisesIndex.clear();
          }
        }
        else {
          _currentlyTraining = true;
          _currentTime = _currentTime - 1;
        }
      }));
    }
  }

  _runPause(int remainingExercises) {
    _currentTitle = "Pause";
    _currentDescription = "Do a little break of 10 seconds and remember to breath.";
    _currentTime = 10;
      
     Timer.periodic(Duration(seconds: 1), (Timer timer) => setState(() {
        if (_currentTime < 1) {
          timer.cancel();
          _currentTime = 0;
          _playExercises(remainingExercises);
        }
        else {
          _currentlyTraining = true;
          _currentTime = _currentTime - 1;
        }
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Morning > Training"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleWidget(title: "Morning Training"),
            Visibility(
              child: Expanded(
                flex: 2,
                child: Text("${_currentTime ~/ 60}:${_currentTime % 60}", style: Theme.of(context).textTheme.headline),
              ),
              visible: _currentlyTraining,
            ),
            Visibility(
              child: Expanded(
                flex: 5,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svg/women_sport.svg',
                              semanticsLabel: "Sportive Women",
                            ),
                          ),
                        ),
                         SizedBox(height: 24,),
                        Text(_currentTitle, style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.black87))),
                      ]
                    ),
                  ),
                ),
              ),
              visible: _currentlyTraining,
            ),
            Expanded(
              flex: _currentlyTraining ? 3 : 7,
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Visibility(
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svg/women_sport.svg',
                              semanticsLabel: "Sportive Women",
                            ),
                          ),
                          visible: !_currentlyTraining,
                        ),
                        Visibility(
                          child: SizedBox(height: 24,),
                          visible: !_currentlyTraining,
                        ),
                        Text(_currentDescription, style: TextStyle(color: Colors.white),),
                    ]
                  ),
                ),
              ),
            ),
            Visibility(
            child: Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () => {
                        _playExercises(4)
                      },
                      child: Padding(padding: EdgeInsets.all(24), child:Text("5\nMIN", textAlign: TextAlign.center, style: TextStyle(color:  Colors.white,),)),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(250.0),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () => {},
                      child: Padding(padding: EdgeInsets.all(24), child:Text("10\nMIN", textAlign: TextAlign.center, style: TextStyle(color:  Colors.white,),)),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(250.0),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () => {},
                      child: Padding(padding: EdgeInsets.all(24), child:Text("15\nMIN", textAlign: TextAlign.center, style: TextStyle(color:  Colors.white,),)),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(250.0),
                      ),
                    ),
                  ],
                )
              ),
              visible: !_currentlyTraining,
            )
          ],
        )
      ),
    );
  }
}