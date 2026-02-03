import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../bloc/workout_state.dart';
import 'add_exercise_sheet.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Workout"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              context.read<WorkoutBloc>().add(SaveWorkout());
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Workout saved 💪")));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (_) => const AddExerciseSheet(),
        ),
      ),
      body: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          if (state is WorkoutSaving) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WorkoutEditing) {
            if (state.exercises.isEmpty) {
              return const Center(child: Text("No exercises yet 💪"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.exercises.length,
              itemBuilder: (_, i) {
                final ex = state.exercises[i];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ex.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        ...ex.sets.map(
                          (s) => Text("• ${s.reps} reps × ${s.weight} kg"),
                        ),

                        if (ex.note != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              "📝 ${ex.note}",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ),

                        const SizedBox(height: 8),

                        Text("⏱ Rest: ${ex.restSeconds}s"),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
