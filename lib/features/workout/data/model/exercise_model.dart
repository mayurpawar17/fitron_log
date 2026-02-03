class ExerciseSet {
  int reps;
  double weight;

  ExerciseSet({required this.reps, required this.weight});

  Map<String, dynamic> toMap(int exerciseId) => {
    'exercise_id': exerciseId,
    'reps': reps,
    'weight': weight,
  };
}

class Exercise {
  String name;
  List<ExerciseSet> sets;
  String? note;
  int restSeconds;

  Exercise({
    required this.name,
    required this.sets,
    this.note,
    this.restSeconds = 60,
  });
}
