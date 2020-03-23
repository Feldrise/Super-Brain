
import 'package:flutter/material.dart';
import 'package:super_brain/Translations.dart';
import 'package:super_brain/Widgets/CardButton.dart';
import 'package:super_brain/Widgets/TipWidget.dart';

class HomePage extends StatelessWidget {
  HomePage({this.onPush});

  final ValueChanged<String> onPush;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text("home_title")),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(flex: 4, child: TipWidget()),
            // If we finally choose to have it vertical ^^' 
            // Expanded(
            //   flex: 2,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     mainAxisSize: MainAxisSize.max,
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: <Widget>[
            //       Expanded(child: CardButton(icon: Icons.format_list_numbered, title: Translations.of(context).text("10words_list"), destinationPage: "tenWordsPage", onPush: onPush, showVertical: true,)),
            //       Expanded(child: CardButton(icon: Icons.format_list_numbered, title: Translations.of(context).text("15words_list"), destinationPage: "fifteenWordsPage", onPush: onPush, showVertical: true)),
            //     ],
            //   ),
            // ),
            Expanded(flex: 2, child: CardButton(icon: Icons.format_list_numbered, title: Translations.of(context).text("10words_list"), destinationPage: "tenWordsPage", onPush: onPush)),
            Expanded(flex: 2, child: CardButton(icon: Icons.format_list_numbered, title: Translations.of(context).text("15words_list"), destinationPage: "fifteenWordsPage", onPush: onPush,)),
            Expanded(flex: 2, child: CardButton(icon: Icons.format_list_numbered, title: Translations.of(context).text("20words_list"), destinationPage: "twentyWordsPage", onPush: onPush,)),
          ],
        )
      )
    );
  }
}