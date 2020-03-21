import 'package:super_brain/DatabaseHelper.dart';

class JournalItem {
  JournalItem({this.id, this.title, this.content});

  int id;
  String title;
  String content;

  // convenience constructor to create a Word object
  JournalItem.fromMap(Map<String, dynamic> map) {
    id = map[journalsColumnId];
    title = map[journalsColumnTitle];
    content = map[journalsColumnContent];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      journalsColumnTitle: title,
      journalsColumnContent: content
    };
    if (id != null) {
      map[journalsColumnId] = id;
    }
    return map;
  }
}