
import 'package:flutter/material.dart';
import 'package:super_brain/Translations.dart';
import 'package:super_brain/Widgets/CardButton.dart';

class MorningPage extends StatelessWidget {
  MorningPage({this.onPush});

  final ValueChanged<String> onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("morning_title")),
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
                    Expanded(child: CardButton(icon: Icons.brightness_4, title: Translations.of(context).text("dreams_journal_title"), destinationPage: "dreamsJournalPage", onPush: onPush, showVertical: true,)),
                    Expanded(child: CardButton(icon: Icons.spa, title: Translations.of(context).text("breathing_exercises_title"), destinationPage: "breathingExercicesPage", onPush: onPush, showVertical: true,)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(child: CardButton(icon: Icons.book, title: Translations.of(context).text("daily_journal_title"), destinationPage: "dailyJournalPage", onPush: onPush, showVertical: true,)),
                    Expanded(child: CardButton(icon: Icons.insert_emoticon, title: Translations.of(context).text("morning_training_title"), destinationPage: "morningTrainingPage", onPush: onPush, showVertical: true,)),  
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