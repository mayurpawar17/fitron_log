import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String subtitle;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' $unit',
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(icon, size: 14, color: AppColors.accent),
              const SizedBox(width: 4),
              Text(subtitle, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
