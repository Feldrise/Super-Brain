import 'package:super_brain/DatabaseHelper.dart';

class DreamItem {
  DreamItem({this.id, this.date, this.text});

  int id;
  String date;
  String text;

  // convenience constructor to create a Word object
  DreamItem.fromMap(Map<String, dynamic> map) {
    id = map[dreamsColumnId];
    date = map[dreamsColumnDate];
    text = map[dreamsColumnText];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      dreamsColumnDate: date,
      dreamsColumnText: text
    };
    if (id != null) {
      map[dreamsColumnId] = id;
    }
    return map;
  }
}