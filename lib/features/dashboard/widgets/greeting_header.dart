import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Hi, Alex 👋',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          "Let's keep the streak going!",
          style: TextStyle(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
