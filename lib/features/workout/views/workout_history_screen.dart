import 'package:flutter/material.dart';
import '../data/db/workout_db.dart';

class WorkoutHistoryScreen extends StatefulWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  State<WorkoutHistoryScreen> createState() => _WorkoutHistoryScreenState();
}

class _WorkoutHistoryScreenState extends State<WorkoutHistoryScreen> {
  List<Map<String, dynamic>> workouts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadWorkouts();
  }

  Future<void> loadWorkouts() async {
    final data = await WorkoutDB.instance.getWorkouts();
    setState(() {
      workouts = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout History'),actions: [
        IconButton(
          icon: const Icon(Icons.history),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const WorkoutHistoryScreen(),
              ),
            );
          },
        ),
      ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : workouts.isEmpty
          ? const Center(child: Text('No workouts logged yet 💪'))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workouts.length,
        itemBuilder: (_, i) {
          final w = workouts[i];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.fitness_center),
              title: Text(_formatDate(w['date'])),
              subtitle: Text(
                '${w['exerciseCount']} exercises\n${w['notes'] ?? ''}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                // Next: Workout Details screen
              },
            ),
          );
        },
      ),
    );
  }

  String _formatDate(String iso) {
    final d = DateTime.parse(iso);
    return '${d.day}/${d.month}/${d.year}';
  }
}
