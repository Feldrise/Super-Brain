
import 'package:flutter/material.dart';
import 'package:super_brain/Widgets/CardButton.dart';

class MorningPage extends StatelessWidget {
  MorningPage({this.onPush});

  final ValueChanged<String> onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            AspectRatio(aspectRatio: 4 / 1, child: CardButton(icon: Icons.brightness_4, title: "Dreams Journal", destinationPage: "dreamsJournalPage", onPush: onPush)),
            AspectRatio(aspectRatio: 4 / 1, child: CardButton(icon: Icons.spa, title: "Breathing Exercices", destinationPage: "breathingExercicesPage", onPush: onPush)),
            AspectRatio(aspectRatio: 4 / 1, child: CardButton(icon: Icons.book, title: "Daily Journal", destinationPage: "dailyJournalPage", onPush: onPush,)),
            AspectRatio(aspectRatio: 4 / 1, child: CardButton(icon: Icons.insert_emoticon, title: "Morning Training", destinationPage: "morningTrainingPage", onPush: onPush,)),
          ],
        )
      )
    );
  }
}