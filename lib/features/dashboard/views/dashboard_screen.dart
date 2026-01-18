import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../widgets/action_card.dart';
import '../widgets/goal_card.dart';
import '../widgets/greeting_header.dart';
import '../widgets/quote_card.dart';
import '../widgets/stat_card.dart';
import '../widgets/today_workout_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            GreetingHeader(),
            SizedBox(height: 16),
            GoalCard(),
            SizedBox(height: 16),
            TodayWorkoutCard(),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'WEIGHT',
                    value: '75',
                    unit: 'kg',
                    subtitle: '-2 kg from start',
                    icon: Icons.trending_down,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'STREAK',
                    value: '12',
                    unit: 'days',
                    subtitle: 'Keep it up!',
                    icon: Icons.local_fire_department,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ActionCard(),
            SizedBox(height: 16),
            QuoteCard(),
          ],
        ),
      ),
    );
  }
}
