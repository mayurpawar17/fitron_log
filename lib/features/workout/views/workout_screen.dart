import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Log')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _exerciseCard('Bench Press', '4 x 10 • 60 kg'),
          _exerciseCard('Incline Dumbbell Press', '3 x 12 • 20 kg'),
        ],
      ),
    );
  }
}

class _exerciseCard extends StatelessWidget {
  final String name;
  final String details;

  const _exerciseCard(this.name, this.details);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(name),
        subtitle: Text(details),
        trailing: const Icon(Icons.edit),
      ),
    );
  }
}
