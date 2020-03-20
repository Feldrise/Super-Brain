
import 'package:flutter/material.dart';

class WordWidget extends StatelessWidget {

  const WordWidget({Key key, this.number, this.word}) : super(key: key);

  final String number;
  final String word;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 32,
              child: Text("$number."),
            ),
            Expanded(
              child: Text(word),
            ),
          ],
        ),
      ),
    );
  }
}