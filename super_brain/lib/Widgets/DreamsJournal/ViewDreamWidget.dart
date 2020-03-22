
import 'package:flutter/material.dart';
import 'package:super_brain/Models/DreamItem.dart';
import 'package:super_brain/Translations.dart';
import 'package:super_brain/Widgets/InputDialog.dart';

class ViewDreamWidget extends StatefulWidget {
  const ViewDreamWidget({Key key, @required this.initialDream, this.onDreamEdited}) : super(key: key); 

  final DreamItem initialDream;

  final DreamEdited onDreamEdited;

  ViewDreamWidgetState createState() => ViewDreamWidgetState();
}

class ViewDreamWidgetState extends State<ViewDreamWidget> {
  DreamItem dreamItem;

  @override
  void initState() {
    super.initState();

    dreamItem = widget.initialDream;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(dreamItem.date, style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 24),
            Expanded(
              child: Text(dreamItem.text), 
            ),
            FlatButton(
              onPressed: () async {
                final String text = await InputDialog.asyncStringDialog(
                    context,
                    Translations.of(context).text("dialog_dream_description"),
                    Translations.of(context).text("dialog_dream_title"),
                    Translations.of(context).text("dialog_dream_exemple"),
                    dreamItem.text);
                if (text.isNotEmpty) {
                  setState(() {
                    dreamItem.text = text;
                  });

                  widget.onDreamEdited(dreamItem);
                }
              }, 
              child: Text(Translations.of(context).text("edit"))),
          ],
        ),
      ),
    );
  }
}

typedef DreamEdited = void Function(DreamItem dreamItem);