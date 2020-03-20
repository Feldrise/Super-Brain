
import 'package:flutter/material.dart';
import 'package:super_brain/Models/DreamItem.dart';
import 'package:super_brain/Widgets/ViewDreamDialog.dart';

class DreamWidget extends StatefulWidget {
  const DreamWidget({Key key, @required this.initialDream, @required this.onDreamRemovedRemoved}) : super(key: key);

  final DreamItem initialDream;

  final DreamRemoved onDreamRemovedRemoved;

  DreamWidgetState createState() => DreamWidgetState();
}

class DreamWidgetState extends State<DreamWidget> {
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
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(dreamItem.date, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(dreamItem.text)
                ],
              )
            ),
            Container(
            width: 64,
            child: Column(
              children: <Widget>[
                Material(
                  color: Theme.of(context).cardColor,
                  child: Center(
                    child: Ink(
                      decoration: ShapeDecoration(
                          color: Theme.of(context).accentColor, shape: CircleBorder()),
                      child: IconButton(
                        icon: Icon(Icons.visibility),
                        color: Colors.white,
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => ViewDreamDialog(dreamItem: dreamItem),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Theme.of(context).cardColor,
                  child: Center(
                    child: Ink(
                      decoration: ShapeDecoration(
                          color: Theme.of(context).accentColor, shape: CircleBorder()),
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.white,
                        onPressed: () {
                          widget.onDreamRemovedRemoved(dreamItem);
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ],
        )
      ),
    );
  }
}

typedef DreamRemoved = void Function(DreamItem dreamItem);
