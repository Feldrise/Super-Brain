
import 'package:flutter/material.dart';
import 'package:super_brain/Widgets/CardButton.dart';

class MorningPage extends StatelessWidget {
  MorningPage({this.onPush});

  final ValueChanged<String> onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Morning"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15, bottom: MediaQuery.of(context).size.height * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded( 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(child: CardButton(icon: Icons.brightness_4, title: "Dreams Journal", destinationPage: "dreamsJournalPage", onPush: onPush, showVertical: true,)),
                    Expanded(child: CardButton(icon: Icons.spa, title: "Breathing Exercices", destinationPage: "breathingExercicesPage", onPush: onPush, showVertical: true,)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(child: CardButton(icon: Icons.book, title: "Daily Journal", destinationPage: "dailyJournalPage", onPush: onPush, showVertical: true,)),
                    Expanded(child: CardButton(icon: Icons.insert_emoticon, title: "Morning Training", destinationPage: "morningTrainingPage", onPush: onPush, showVertical: true,)),  
                  ],
                ),
              ),
            ],
          )
        )
      )
    );
  }
}