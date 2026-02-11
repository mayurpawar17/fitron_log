import 'package:fitron_log/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import './features/home/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitron Log',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
