import '../db/workout_db.dart';
import '../model/exercise_model.dart';
import '../model/workout_model4.dart';

class WorkoutRepository {
  final dbProvider = WorkoutDB.instance;

  Future<void> saveWorkout(Workout workout) async {
    final db = await dbProvider.database;

    final workoutId = await db.insert('workouts', {
      'date': workout.date.toIso8601String(),
    });

    for (final ex in workout.exercises) {
      final exerciseId = await db.insert('exercises', {
        'workout_id': workoutId,
        'name': ex.name,
        'rest_seconds': ex.restSeconds,
        'note': ex.note,
      });

      for (final set in ex.sets) {
        await db.insert('sets', set.toMap(exerciseId));
      }
    }
  }

  /// Load latest workout
  Future<Workout?> getLatestWorkout() async {
    final db = await dbProvider.database;

    final workoutRes = await db.query(
      'workouts',
      orderBy: 'date DESC',
      limit: 1,
    );

    if (workoutRes.isEmpty) return null;

    final workoutId = workoutRes.first['id'] as int;

    final exercisesRes = await db.query(
      'exercises',
      where: 'workout_id = ?',
      whereArgs: [workoutId],
    );

    List<Exercise> exercises = [];

    for (final ex in exercisesRes) {
      final setsRes = await db.query(
        'sets',
        where: 'exercise_id = ?',
        whereArgs: [ex['id']],
      );

      exercises.add(
        Exercise(
          name: ex['name'] as String,
          restSeconds: ex['rest_seconds'] as int,
          note: ex['note'] as String?,
          sets: setsRes
              .map(
                (s) => ExerciseSet(
                  reps: s['reps'] as int,
                  weight: s['weight'] as double,
                ),
              )
              .toList(),
        ),
      );
    }

    return Workout(
      id: workoutId,
      date: DateTime.parse(workoutRes.first['date'] as String),
      exercises: exercises,
    );
  }
}
