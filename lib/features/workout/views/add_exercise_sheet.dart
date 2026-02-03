import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../data/model/exercise_model.dart';

class AddExerciseSheet extends StatefulWidget {
  const AddExerciseSheet({super.key});

  @override
  State<AddExerciseSheet> createState() => _AddExerciseSheetState();
}

class _AddExerciseSheetState extends State<AddExerciseSheet> {
  final nameCtrl = TextEditingController();
  final noteCtrl = TextEditingController();
  int rest = 60;
  List<ExerciseSet> sets = [];

  void addSet() {
    sets.add(ExerciseSet(reps: 10, weight: 40));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "Exercise Name"),
              ),

              const SizedBox(height: 12),

              ElevatedButton(onPressed: addSet, child: const Text("Add Set")),

              ...sets.map(
                (s) => ListTile(
                  title: Text("${s.reps} reps"),
                  trailing: Text("${s.weight} kg"),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  const Text("Rest"),
                  Expanded(
                    child: Slider(
                      value: rest.toDouble(),
                      min: 30,
                      max: 180,
                      divisions: 5,
                      label: "$rest sec",
                      onChanged: (v) {
                        rest = v.toInt();
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),

              TextField(
                controller: noteCtrl,
                decoration: const InputDecoration(
                  labelText: "Notes (form, pain, PR)",
                ),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  context.read<WorkoutBloc>().add(
                    AddExercise(
                      Exercise(
                        name: nameCtrl.text,
                        sets: sets,
                        note: noteCtrl.text,
                        restSeconds: rest,
                      ),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text("Save Exercise"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
