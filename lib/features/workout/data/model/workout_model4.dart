import 'exercise_model.dart';

class Workout {
  int? id;
  DateTime date;
  List<Exercise> exercises;

  Workout({this.id, required this.date, required this.exercises});
}
