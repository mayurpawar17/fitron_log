import 'dart:io';

import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/progress_photo_bloc.dart';
import '../bloc/progress_photo_state.dart';

class ComparePhotosScreen extends StatelessWidget {
  const ComparePhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ProgressPhotoBloc>().state;

    if (state is! ProgressPhotoLoaded || state.photos.length < 2) {
      return const Scaffold(
        body: Center(child: Text('Not enough photos to compare')),
      );
    }

    final before = state.photos.last.frontPath!;
    final after = state.photos.first.frontPath!;

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
