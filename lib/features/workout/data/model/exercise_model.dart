class Exercise {
  String name;
  List<WorkoutSet> sets;

  Exercise({
    required this.name,
    required this.sets,
  });
}

class WorkoutSet {
  int weight;
  int reps;

  WorkoutSet({this.weight = 0, this.reps = 0});
}
