class BreathingExercise {
  BreathingExercise({this.duration, this.description});

  int duration;
  String description;

  factory BreathingExercise.fromJson(Map<String, dynamic> json) {
    return BreathingExercise(
      duration: json['duration'],
      description: json['description'],
    );
  }
}