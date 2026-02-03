import '../data/model/exercise_model.dart';

abstract class WorkoutEvent {}

class AddExercise extends WorkoutEvent {
  final Exercise exercise;
  AddExercise(this.exercise);
}

class RemoveExercise extends WorkoutEvent {
  final int index;
  RemoveExercise(this.index);
}

class ResetWorkout extends WorkoutEvent {}

class SaveWorkout extends WorkoutEvent {}
