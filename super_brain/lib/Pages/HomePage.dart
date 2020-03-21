
import 'package:flutter/material.dart';
import 'package:super_brain/Widgets/CardButton.dart';
import 'package:super_brain/Widgets/TipWidget.dart';

class HomePage extends StatelessWidget {
  HomePage({this.onPush});

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
            Expanded(flex: 4, child: TipWidget()),
            Expanded(flex: 2, child: CardButton(icon: Icons.format_list_numbered, title: "Daily 10 words list", destinationPage: "tenWordsPage", onPush: onPush)),
            Expanded(flex: 2, child: CardButton(icon: Icons.format_list_numbered, title: "Daily 15 words list", destinationPage: "fifteenWordsPage", onPush: onPush,)),
            Expanded(flex: 2, child: CardButton(icon: Icons.format_list_numbered, title: "Daily 20 words list", destinationPage: "twentyWordsPage", onPush: onPush,)),
          ],
        )
      )
    );
  }
}