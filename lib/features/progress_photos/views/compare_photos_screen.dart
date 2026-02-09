import 'dart:io';

import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/progress_photo_bloc.dart';
import '../bloc/progress_photo_state.dart';
import '../data/model/progress_photo.dart';

class ComparePhotosScreen extends StatelessWidget {
  final List<ProgressPhoto> photos;

  const ComparePhotosScreen({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    final before = photos.last.front!;
    final after = photos.first.front!;

    return Scaffold(
      appBar: AppBar(title: const Text('Before vs After')),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: BeforeAfter(
          after: Image.file(File(after)),
          before: Image.file(File(before)),
        ),
      ),
    );
  }
}
