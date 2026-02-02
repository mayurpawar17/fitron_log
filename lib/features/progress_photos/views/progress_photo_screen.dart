import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/progress_photo_bloc.dart';
import '../bloc/progress_photo_state.dart';
import 'add_progress_photo_sheet.dart';
import 'compare_photos_screen.dart';

class ProgressPhotoScreen extends StatelessWidget {
  const ProgressPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Photos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.compare),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ComparePhotosScreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (_) => const AddProgressPhotoSheet(),
        ),
        child: const Icon(Icons.add_a_photo),
      ),
      body: BlocBuilder<ProgressPhotoBloc, ProgressPhotoState>(
        builder: (context, state) {
          if (state is ProgressPhotoLoaded) {
            if (state.photos.isEmpty) {
              return const Center(
                child: Text(
                  'Add your first progress photo 📸',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.photos.length,
              itemBuilder: (_, i) {
                final photo = state.photos[i];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${photo.date.toLocal()}'.split(' ')[0],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _image(photo.frontPath),
                            _image(photo.sidePath),
                            _image(photo.backPath),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _image(String? path) {
    return Expanded(
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade200,
        ),
        child: path == null
            ? const Icon(Icons.camera_alt_outlined)
            : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(File(path), fit: BoxFit.cover),
              ),
      ),
    );
  }
}
