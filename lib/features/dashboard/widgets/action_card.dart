import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ActionCard extends StatelessWidget {
  final VoidCallback? onTap;

  const ActionCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondaryLightColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: const [
            Icon(Icons.camera_alt, color: AppColors.accent),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Progress Photo',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Track your visual transformation',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
