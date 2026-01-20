import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.accent),
        gradient: LinearGradient(
          colors: [AppColors.accent.withOpacity(0.15), Colors.transparent],
        ),
      ),
      child: Column(
        children: const [
          Text(
            '"Every workout is progress, not perfection."',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            "You're closer to your goals today than yesterday",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
