import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            AppColors.accent.withOpacity(0.2),
            Colors.transparent
          ],
        ),
        border: Border.all(color: AppColors.accent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('CURRENT GOAL', style: TextStyle(fontSize: 12)),
          SizedBox(height: 6),
          Text(
            'Muscle Gain',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            'Stay consistent and track every workout',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
