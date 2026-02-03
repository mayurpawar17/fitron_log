import '../data/model/exercise_model.dart';

// class WorkoutState {
//   final List<Exercise> exercises;
//
//   WorkoutState(this.exercises);
// }

abstract class WorkoutState {}

class WorkoutEditing extends WorkoutState {
  final List<Exercise> exercises;
  WorkoutEditing(this.exercises);
}

class WorkoutSaving extends WorkoutState {}

class WorkoutSaved extends WorkoutState {}
