import 'package:flutter/material.dart';

class InputDialog {
  static Future<String> asyncStringDialog(BuildContext context, String description, String label, String placeholder, String defaultValue) async {
    String _result = '';

    return showDialog<String>(
      context: context,
      barrierDismissible:
          true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(description),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                controller: TextEditingController()..text = defaultValue,
                autofocus: true,
                maxLines: null,
                decoration: new InputDecoration(
                    labelText: label, hintText: placeholder),
                onChanged: (value) {
                  _result = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop("");
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(_result);
              },
            ),
          ],
        );
      },
    );
  }
}