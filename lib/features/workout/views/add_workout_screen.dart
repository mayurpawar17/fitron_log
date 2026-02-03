// import 'package:fitron_log/features/workout/views/workout_history_screen.dart';
// import 'package:flutter/material.dart';
// import '../data/db/workout_db.dart';
// import '../data/model/exercise_model.dart';
//
// class AddWorkoutScreen extends StatefulWidget {
//   const AddWorkoutScreen({super.key});
//
//   @override
//   State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
// }
//
// class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
//   final List<Exercise> exercises = [];
//   final TextEditingController notesCtrl = TextEditingController();
//
//   void addExercise() {
//     // setState(() {
//     //   exercises.add(
//     //     Exercise(
//     //       name: '',
//     //       // restSeconds: 60,
//     //       sets: [ExerciseSet(reps: 10, weight: 20)],
//     //     ),
//     //   );
//     // });
//   }
//
//   Future<void> saveWorkout() async {
//     final db = await WorkoutDB.instance.database;
//
//     final workoutId = await db.insert('workouts', {
//       'date': DateTime.now().toIso8601String(),
//       'notes': notesCtrl.text,
//     });
//
//     for (final ex in exercises) {
//       final exerciseId = await db.insert('exercises', {
//         'workout_id': workoutId,
//         'name': ex.name,
//         // 'rest_seconds': ex.restSeconds,
//       });
//
//       for (final s in ex.sets) {
//         await db.insert('sets', {
//           'exercise_id': exerciseId,
//           'reps': s.reps,
//           'weight': s.weight,
//         });
//       }
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Today’s Wfgforkout"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.history,color: Colors.white,),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const WorkoutHistoryScreen(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: addExercise,
//         child: const Icon(Icons.add),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           ...exercises.map((e) => ExerciseCard(
//             exercise: e,
//             onChanged: () => setState(() {}),
//           )),
//           const SizedBox(height: 20),
//           TextField(
//             controller: notesCtrl,
//             maxLines: 3,
//             decoration: const InputDecoration(
//               labelText: "Workout Notes",
//               hintText: "Form cues, pain, PR attempts...",
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: saveWorkout,
//             child: const Text("Save Workout"),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class ExerciseCard extends StatelessWidget {
//   final Exercise exercise;
//   final VoidCallback onChanged;
//
//   const ExerciseCard({
//     super.key,
//     required this.exercise,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               decoration: const InputDecoration(labelText: "Exercise Name"),
//               onChanged: (v) {
//                 exercise.name = v;
//                 onChanged();
//               },
//             ),
//             const SizedBox(height: 12),
//
//             /// Sets
//             ...exercise.sets.asMap().entries.map((entry) {
//               final set = entry.value;
//               return Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(labelText: "Reps"),
//                       onChanged: (v) =>
//                       set.reps = int.tryParse(v) ?? 0,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: TextField(
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(labelText: "Weight"),
//                       onChanged: (v) =>
//                       set.weight = double.tryParse(v) ?? 0,
//                     ),
//                   ),
//                 ],
//               );
//             }),
//
//             TextButton(
//               onPressed: () {
//                 exercise.sets.add(
//                   ExerciseSet(reps: 10, weight: 20),
//                 );
//                 onChanged();
//               },
//               child: const Text("+ Add Set"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
