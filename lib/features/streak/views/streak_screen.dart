import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../progress/widgets/workout_summary_card.dart';

class HabitStreakScreen extends StatefulWidget {
  const HabitStreakScreen({super.key});

  @override
  State<HabitStreakScreen> createState() => _HabitStreakScreenState();
}

class _HabitStreakScreenState extends State<HabitStreakScreen> {
  final Map<DateTime, bool> completedDays = {};

  DateTime normalize(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  void toggleDay(DateTime day) {
    final date = normalize(day);
    setState(() {
      completedDays[date] = !(completedDays[date] ?? false);
    });
  }

  int calculateStreak() {
    int streak = 0;
    DateTime day = normalize(DateTime.now());

    while (completedDays[day] == true) {
      streak++;
      day = day.subtract(const Duration(days: 1));
    }
    return streak;
  }

  @override
  Widget build(BuildContext context) {
    final streak = calculateStreak();

    return Scaffold(
      // appBar: AppBar(title: const Text("Habit Streaks"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔥 Streak Counter
              // Text(
              //   "🔥 $streak day streak",
              //   style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              // ),

              // const SizedBox(height: 16),

              /// 📅 Calendar
              TableCalendar(
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),

                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, _) {
                    final date = normalize(day);
                    final completed = completedDays[date] ?? false;

                    return GestureDetector(
                      onTap: () => toggleDay(day),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: completed
                              ? Colors.greenAccent
                              : Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${day.day}",
                          style: TextStyle(
                            color: completed ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              WorkoutSummaryCard(),
            ],
          ),
        ),
      ),
    );
  }
}
