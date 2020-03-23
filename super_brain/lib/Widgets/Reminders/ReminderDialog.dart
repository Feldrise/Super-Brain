import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_brain/Models/Reminder.dart';
import 'package:super_brain/Translations.dart';

class ReminderDialog extends StatelessWidget {
  const ReminderDialog({Key key, @required this.reminder}) : super(key: key);

  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 82, // 66 + 16,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            margin: EdgeInsets.only(top: 66),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  reminder.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  reminder.content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: Text(Translations.of(context).text("ok"), style: TextStyle(color: Theme.of(context).accentColor),),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 66,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: SvgPicture.asset(
                  'assets/icon/icon.svg',
                  semanticsLabel: "Icon",
                ),
              ),
            ),
          ),
        ],
      )
    //   child: Card(
    //   child: Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         Text(reminder.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,),),
    //         SizedBox(height: 24),
    //         Text(reminder.content), 
    //         SizedBox(height: 24),
    //         Align(
    //           alignment: Alignment.bottomRight,
    //           child: FlatButton(
    //             onPressed: () async { Navigator.of(context).pop(); }, 
    //             child: Text(Translations.of(context).text("ok"), style: TextStyle(color: Theme.of(context).accentColor),)
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // )
    );
  }
}
