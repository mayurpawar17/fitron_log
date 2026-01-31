import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Today’s Workout'),
            SizedBox(height: 4),
            Text(
              'Chest & Triceps • 45 min',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text('Bench Press'),
              children: [ExerciseCard(exerciseName: 'Bench Press')],
            ),
          ),

          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text('Leg Press'),
              children: [ExerciseCard(exerciseName: 'Bench Press')],
            ),
          ),

        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Exercise'),
      ),

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: ElevatedButton(
      //     onPressed: () {},
      //     style: ElevatedButton.styleFrom(
      //       padding: const EdgeInsets.symmetric(vertical: 16),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(16),
      //       ),
      //     ),
      //     child: const Text('Save Workout', style: TextStyle(fontSize: 16)),
      //   ),
      // ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String exerciseName;

  const ExerciseCard({
    super.key,
    required this.exerciseName,
  });

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF1DBF84);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// EXERCISE HEADER
          // Row(
          //   children: [
          //     Expanded(
          //       child: Text(
          //         exerciseName,
          //         style: const TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ),
          //     Icon(
          //       Icons.more_horiz,
          //       color: Colors.grey.shade600,
          //     ),
          //   ],
          // ),
          //
          // const SizedBox(height: 16),

          /// SETS HEADER (Aligned with rows)
          Row(
            children: const [
              SizedBox(
                width: 32,
                child: Text(
                  'Set',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Center(
                  child: Text(
                    'Kg',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Center(
                  child: Text(
                    'Reps',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: 70,
                child: Text(
                  'Previous',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// SET ROWS
          const WorkoutSetRow(
            set: 1,
            weight: '60',
            reps: '10',
            prev: '4×65',
          ),
          const WorkoutSetRow(
            set: 2,
            weight: '80',
            reps: '8',
            prev: '4×65',
            isPR: true,
          ),

          const SizedBox(height: 16),

          /// ADD SET
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Set'),
              style: OutlinedButton.styleFrom(
                foregroundColor: accent,
                side: BorderSide(color: accent.withOpacity(0.6)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutSetRow extends StatelessWidget {
  final int set;
  final String weight;
  final String reps;
  final String prev;
  final bool isPR;

  const WorkoutSetRow({
    super.key,
    required this.set,
    required this.weight,
    required this.reps,
    required this.prev,
    this.isPR = false,
  });

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF1DBF84);
    const chipBg = Color(0xFF2EE6A6);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          /// SET NUMBER
          SizedBox(
            width: 32,
            child: Text(
              '$set',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(width: 8),

          /// WEIGHT
          Expanded(
            child: _inputChip(
              hint: weight,
              editable: true,
              accent: accent,
              chipBg: chipBg,
            ),
          ),

          const SizedBox(width: 8),

          /// REPS
          Expanded(
            child: _inputChip(
              hint: reps,
              editable: true,
              accent: accent,
              chipBg: chipBg,
            ),
          ),

          const SizedBox(width: 8),

          /// PREVIOUS (READ ONLY)
          SizedBox(
            width: 70,
            child: Text(
              prev,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // if (isPR) ...[
          //   const SizedBox(width: 8),
          //   const Icon(Icons.emoji_events, size: 18, color: Colors.amber),
          // ],
        ],
      ),
    );
  }

  static Widget _inputChip({
    required String hint,
    required bool editable,
    required Color accent,
    required Color chipBg,
  }) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: chipBg.withOpacity(0.18),
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: accent.withOpacity(0.4)),
      ),
      child: TextField(
        enabled: editable,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: accent),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    );
  }
}
