
import 'package:flutter/material.dart';
import 'package:super_brain/Widgets/CardButton.dart';
import 'package:super_brain/Widgets/TipWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: TipWidget()),
        AspectRatio(aspectRatio: 3 / 1, child: CardButton(icon: Icons.format_list_numbered, title: "Daily 10 words list", destinationPage: "tenWordsPage",)),
        AspectRatio(aspectRatio: 3 / 1, child: CardButton(icon: Icons.format_list_numbered, title: "Daily 15 words list", destinationPage: "fifteenWordsPage",)),
        AspectRatio(aspectRatio: 3 / 1, child: CardButton(icon: Icons.format_list_numbered, title: "Daily 20 words list", destinationPage: "twentyWordsPage",)),
      ],
    );
  }
}