import 'dart:async';
import 'package:flutter/material.dart';

class RestTimerDialog extends StatefulWidget {
  final int seconds;
  const RestTimerDialog({super.key, required this.seconds});

  @override
  State<RestTimerDialog> createState() => _RestTimerDialogState();
}

class _RestTimerDialogState extends State<RestTimerDialog> {
  late int time;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    time = widget.seconds;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (time == 0) {
        timer?.cancel();
      } else {
        setState(() => time--);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Rest Timer"),
      content: Text(
        "$time sec",
        style: const TextStyle(fontSize: 32),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Done"),
        ),
      ],
    );
  }
}
