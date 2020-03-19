
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key key, this.title}) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 1,
      child: Center(
        child: Text(title)
      ),
    );
  }
}