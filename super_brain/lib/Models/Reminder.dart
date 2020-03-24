class Reminder {
  Reminder({this.title, this.summary, this.content});

  String title;
  String summary;
  String content;

  factory Reminder.fromJson(Map<String, dynamic> json) {
    String reminderContent = "";

    for (var line in json['content']) {
      reminderContent += line;
    }

    return Reminder(
      title: json['title'],
      summary: json['summary'],
      content: reminderContent,
    );
  }
}