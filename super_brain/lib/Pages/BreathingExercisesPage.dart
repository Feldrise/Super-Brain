import 'package:flutter/material.dart';

class BreathingExercisesPage extends StatefulWidget {
  BreathingExercisesPageState createState() => BreathingExercisesPageState();
}

class BreathingExercisesPageState extends State<BreathingExercisesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Morning > Breathing Exercises"),
      ),
      body: Container(
        color: Colors.pink,
      ),
    );
  }
}