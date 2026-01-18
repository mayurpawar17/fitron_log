import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
class ActionCard extends StatelessWidget {
  const ActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: const [
          Icon(Icons.camera_alt, color: AppColors.accent),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Progress Photo', style: TextStyle(fontWeight: FontWeight.w600)),
              Text(
                'Track your visual transformation',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ],
          )
        ],
      ),
    );
  }
}
