
import 'package:flutter/material.dart';
import 'package:super_brain/Widgets/TitleWidget.dart';
import 'package:super_brain/Widgets/WordWidget.dart';

class TenWordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TitleWidget(title: "Daily 10 words list"),
            WordWidget(number: "1", word: "Bee"),
            WordWidget(number: "2", word: "Bee"),
            WordWidget(number: "3", word: "Bee"),
            WordWidget(number: "4", word: "Bee"),
            WordWidget(number: "5", word: "Bee"),
            WordWidget(number: "6", word: "Bee"),
            WordWidget(number: "7", word: "Bee"),
            WordWidget(number: "8", word: "Bee"),
            WordWidget(number: "9", word: "Bee"),
            WordWidget(number: "10", word: "Bee"),
          ],
        ),
      )
    );
  }
}