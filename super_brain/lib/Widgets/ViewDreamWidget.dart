
import 'package:flutter/material.dart';
import 'package:super_brain/Models/DreamItem.dart';

class ViewDreamWidget extends StatefulWidget {
  const ViewDreamWidget({Key key, @required this.initialDream}) : super(key: key); 

  final DreamItem initialDream;

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
            FlatButton(onPressed: () => {}, child: Text("Edit")),
          ],
        ),
      ),
    );
  }
}