
import 'package:flutter/material.dart';
import 'package:super_brain/Models/JournalItem.dart';

class JournalWidget extends StatefulWidget {
  const JournalWidget({Key key, @required this.initialJournal, @required this.onJournalRemoved, @required this.onJournalEdited}) : super(key: key);

  final JournalItem initialJournal;

  final JournalRemoved onJournalRemoved;
  final JournalEdited onJournalEdited;

  JournalWidgetState createState() => JournalWidgetState();
}

class JournalWidgetState extends State<JournalWidget> {
  JournalItem _journalItem;

  void _journalEdited(JournalItem journalItem) {
    setState(() {
      _journalItem = journalItem;
    });
    
    widget.onJournalEdited(_journalItem);
  }

  @override
  void initState() {
    super.initState();

    _journalItem = widget.initialJournal;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(_journalItem.title, style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 8,),
                  Text(_journalItem.content, overflow: TextOverflow.ellipsis, maxLines: 7,)
                ],
              )
            ),
            Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) => ViewDreamDialog(dreamItem: _dreamItem, onDreamEdited: _dreamEdited,),
                          // );
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
                          widget.onJournalRemoved(_journalItem);
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

typedef JournalRemoved = void Function(JournalItem journalItem);
typedef JournalEdited = void Function(JournalItem journalItem);