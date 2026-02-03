import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/workout_model4.dart';
import '../data/repo/workout_repository.dart';
import 'workout_event.dart';
import 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  // final WorkoutRepository repo;
  WorkoutBloc() : super(WorkoutEditing([])) {
    on<AddExercise>((e, emit) {
      final current = state as WorkoutEditing;
      emit(WorkoutEditing([...current.exercises, e.exercise]));
    });

    // on<RemoveExercise>((e, emit) {
    //   final list = [...state.]..removeAt(e.index);
    //   emit(WorkoutState(list));
    // });

    // on<ResetWorkout>((e, emit) {
    //   emit(WorkoutState([]));
    // });

    on<SaveWorkout>((e, emit) async {
      final current = state as WorkoutEditing;

      if (current.exercises.isEmpty) return;

      emit(WorkoutSaving());

      // await repo.saveWorkout(
      //   Workout(date: DateTime.now(), exercises: current.exercises),
      // );

      emit(WorkoutSaved());
      emit(WorkoutEditing([])); // reset for next workout
    });
  }
}
