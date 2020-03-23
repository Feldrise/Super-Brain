import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_brain/Models/TrainingExercise.dart';
import 'package:super_brain/Translations.dart';
import 'package:super_brain/Widgets/TitleWidget.dart';

class MorningTrainingPage extends StatefulWidget {
 MorningTrainingPageState createState() => MorningTrainingPageState(); 
}

class MorningTrainingPageState extends State<MorningTrainingPage> {
  bool _currentlyTraining = false;
  
  int _currentTime = 0;
  String _currentTitle = "A Simple Exercice";
  String _currentImageTitle = "women_sport";
  bool _firstTurnComplete = false;

  List<TrainingExercise> _trainingExercises = [];
  List<int> _playedExercisesIndex = [];

  _playExercises(int remainingTurn, int remainingExercises) {
    if (remainingExercises > 0) {
      final _random = new Random();

      int exerciseIndex = 0;

      if (!_firstTurnComplete) {
        do {
          exerciseIndex = _random.nextInt(_trainingExercises.length);
        } while (_playedExercisesIndex.contains(exerciseIndex));
        
        _playedExercisesIndex.add(exerciseIndex);
      }
      else {
        exerciseIndex = _playedExercisesIndex[_playedExercisesIndex.length - remainingExercises];
      }
      
      _currentTitle = _trainingExercises[exerciseIndex].title;
      _currentImageTitle = _trainingExercises[exerciseIndex].imageTitle;
      _currentTime = 30;

      Timer.periodic(Duration(seconds: 1), (Timer timer) => setState(() {
        if (_currentTime < 1) {
          timer.cancel();
          _currentTime = 0;

          if (remainingExercises > 1) {
            _runPause(remainingTurn, remainingExercises - 1);
          }
          else if (remainingTurn > 1) {
            _firstTurnComplete = true;
            _runPause(remainingTurn - 1, _playedExercisesIndex.length);
          }
          else {
            _currentlyTraining = false;
            _firstTurnComplete = false;
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

  _runPause(int remainingTour, int remainingExercises) {
    _currentTitle = Translations.of(context).text("morning_training_pause_title");
    _currentImageTitle = "women_sport";
    _currentTime = 10;
      
     Timer.periodic(Duration(seconds: 1), (Timer timer) => setState(() {
        if (_currentTime < 1) {
          timer.cancel();
          _currentTime = 0;
          _playExercises(remainingTour, remainingExercises);
        }
        else {
          _currentlyTraining = true;
          _currentTime = _currentTime - 1;
        }
      }));
  }

  @override
  Widget build(BuildContext context) {
    if (_trainingExercises.isEmpty) {
      _trainingExercises.addAll([
        TrainingExercise(imageTitle: "high_knee", title: Translations.of(context).text("training_high_knee")),
        TrainingExercise(imageTitle: "jumping-jacks", title: Translations.of(context).text("training_juming_jacks")),
        TrainingExercise(imageTitle: "lunges", title: Translations.of(context).text("training_lunges")),
        TrainingExercise(imageTitle: "sit-ups", title: Translations.of(context).text("training_sit_ups")),
        TrainingExercise(imageTitle: "squats", title: Translations.of(context).text("training_squats")),
      ]);
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("morning_title") + " > " + Translations.of(context).text("morning_training_title")),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleWidget(title: Translations.of(context).text("morning_training_title")),
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
                              'assets/svg/$_currentImageTitle.svg',
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
            Visibility(
              child: Expanded(
                flex: 5,
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              child: SvgPicture.asset(
                                'assets/svg/women_sport.svg',
                                semanticsLabel: "Sportive Women",
                              ),
                            ),
                          SizedBox(height: 24,),
                          Text(Translations.of(context).text("morning_training_description"), style: TextStyle(color: Colors.white),),
                      ]
                    ),
                  ),
                ),
              ),
              visible: !_currentlyTraining,
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
                        _firstTurnComplete = false,
                        _playExercises(2, 3)
                      },
                      child: Padding(padding: EdgeInsets.all(24), child:Text("4\nMIN", textAlign: TextAlign.center, style: TextStyle(color:  Colors.white,),)),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(250.0),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () => {
                        _firstTurnComplete = false,
                        _playExercises(3, 4)
                      },
                      child: Padding(padding: EdgeInsets.all(24), child:Text("8\nMIN", textAlign: TextAlign.center, style: TextStyle(color:  Colors.white,),)),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(250.0),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () => {
                        _firstTurnComplete = false,
                        _playExercises(4, 4)
                      },
                      child: Padding(padding: EdgeInsets.all(24), child:Text("12\nMIN", textAlign: TextAlign.center, style: TextStyle(color:  Colors.white,),)),
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