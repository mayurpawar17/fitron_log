import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Today’s Workout'),
            SizedBox(height: 4),
            Text(
              'Chest & Triceps • 45 min',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExerciseCard(exerciseName: 'Bench Press'),
          ExerciseCard(exerciseName: 'Incline Dumbbell Press'),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Exercise'),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text('Save Workout', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String exerciseName;

  const ExerciseCard({super.key, required this.exerciseName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Exercise Title
          Row(
            children: [
              Text(
                exerciseName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),

          const SizedBox(height: 12),

          /// Sets Header
          Row(
            children: const [
              Expanded(
                child: Text('Set', style: TextStyle(color: Colors.grey)),
              ),
              Expanded(
                child: Text('Kg', style: TextStyle(color: Colors.grey)),
              ),
              Expanded(
                child: Text('Reps', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// Sets
          WorkoutSetRow(set: 1, weight: '60', reps: '10'),
          WorkoutSetRow(
            set: 2,
            weight: '80',
            reps: '8',
            isPR: true, // 🏆 Personal Record
          ),

          const SizedBox(height: 12),

          /// Add Set
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Set'),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutSetRow extends StatelessWidget {
  final int set;
  final String weight;
  final String reps;
  final bool isPR;

  const WorkoutSetRow({
    super.key,
    required this.set,
    required this.weight,
    required this.reps,
    this.isPR = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          /// Set Number
          Expanded(
            child: Text(
              '$set',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          /// Weight
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: weight,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
          ),

          /// Reps
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: reps,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
          ),

          /// PR Badge
          if (isPR)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.emoji_events, size: 14, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(
                    'PR',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
