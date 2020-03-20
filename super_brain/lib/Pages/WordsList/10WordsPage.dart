
import 'package:flutter/material.dart';
import 'package:super_brain/Widgets/TitleWidget.dart';
import 'package:super_brain/Widgets/WordWidget.dart';

class TenWordsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final List<String> words = [
      "Bee",
      "Diamon",
      "Barrel",
      "Fingerprint",
      "Bird",
      "Fire Hydrant",
      "Forest",
      "Consumption",
      "Circket",
      "Pink"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TitleWidget(title: "Daily 10 words list"),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: words.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: WordWidget(number: "${index + 1}", word: "${words[index]}",),
                      // title: Text("$index. ${words[index]}")
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}