import 'package:fitron_log/features/progress/widgets/workout_summary_card.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Progress')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _infoCard('Body Weight', '72 → 75 kg'),
              SizedBox(height: 16),
              _infoCard('Strength', 'Bench Press ↑'),
              WorkoutSummaryCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _infoCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _infoCard(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(subtitle, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
