import 'dart:async';

import 'package:fitron_log/features/progress/views/progress_photo_screen.dart';
import 'package:fitron_log/features/streak/views/streak_screen.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/helperMethods/permissions.dart';
import '../../progress_photos/views/progress_photo_screen.dart';
import '../widgets/action_card.dart';
import '../widgets/goal_card.dart';
import '../widgets/greeting_header.dart';
import '../widgets/quote_card.dart';
import '../widgets/stat_card.dart';
import '../widgets/today_workout_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late StreamSubscription<StepCount> _stepSubscription;
  int _steps = 0;
  int _initialSteps = 0;

  @override
  void initState() {
    super.initState();
    requestActivityPermission();
    initStepCounter();
  }

  void initStepCounter() {
    _stepSubscription = Pedometer.stepCountStream.listen(
      (StepCount event) {
        if (_initialSteps == 0) {
          _initialSteps = event.steps;
        }

        setState(() {
          _steps = event.steps - _initialSteps;
        });
      },
      onError: (error) {
        debugPrint("Step counter error: $error");
      },
    );
  }

  @override
  void dispose() {
    _stepSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const GreetingHeader(),
            const SizedBox(height: 16),
            const GoalCard(),
            const SizedBox(height: 16),
            const TodayWorkoutCard(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'STEPS',
                    value: '$_steps',
                    unit: '',
                    subtitle: '---',
                    icon: Icons.trending_down,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => HabitStreakScreen()),
                      // );
                    },
                    title: 'STREAK',
                    value: '12',
                    unit: 'days',
                    subtitle: 'Keep it up!',
                    icon: Icons.local_fire_department,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ActionCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProgressPhotoScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            const QuoteCard(),
          ],
        ),
      ),
    );
  }
}
