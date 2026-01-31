import 'package:flutter/material.dart';

class WorkoutSummaryCard extends StatelessWidget {
  const WorkoutSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF2EE6A6).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Text(
                      "Leg Day",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1DBF84),
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: Color(0xFF1DBF84),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                "1m 58s",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// TABLE HEADER
          Row(
            children: const [
              Expanded(
                flex: 2,
                child: Text(
                  "Exercise",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Best Set",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _row("3 x Barbell Deadlift", "6 x 95kg"),
          _row("3 x Leg Press", "8 x 150kg"),
          _row("3 x Bulgarian Split Squat", "8 x 40kg"),
          _row("3 x Quad/Leg Extension", "15 x 60kg"),
          _row("3 x Standing Calf Raise", "15 x 20kg"),

          const SizedBox(height: 20),

          /// TOTAL LIFTED
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2EE6A6),
                  Color(0xFF1DBF84),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: Text(
                "You lifted a total of: 8860kg!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _row(String exercise, String bestSet) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              exercise,
              style: const TextStyle(
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
          Expanded(
            child: Text(
              bestSet,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
