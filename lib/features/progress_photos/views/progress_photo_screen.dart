import 'dart:io';

import 'package:fitron_log/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../data/db/progress_photo_db.dart';
import '../data/model/progress_photo.dart';
import 'add_progress_photo_sheet.dart';
import 'compare_photos_screen.dart';

class ProgressPhotoScreen extends StatefulWidget {
  const ProgressPhotoScreen({super.key});

  @override
  State<ProgressPhotoScreen> createState() => _ProgressPhotoScreenState();
}

class _ProgressPhotoScreenState extends State<ProgressPhotoScreen> {
  List<ProgressPhoto> photos = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    photos = await ProgressPhotoDB.instance.getAll();
    setState(() {});
  }

  Widget imageBox(String? path) {
    return Expanded(
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey.shade200,
        ),
        child: path == null
            ? const Icon(Icons.camera_alt_outlined)
            : ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.file(File(path), fit: BoxFit.cover),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Progress Photos",
        action: IconButton(
          icon: const Icon(Icons.compare),
          onPressed: photos.length < 2
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ComparePhotosScreen(photos: photos),
                    ),
                  );
                },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_a_photo),
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (_) => AddProgressPhotoSheet(onSaved: load),
          );
        },
      ),
      body: photos.isEmpty
          ? const Center(
              child: Text(
                "Add your first progress photo 📸",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: photos.length,
              itemBuilder: (_, i) {
                final p = photos[i];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.date.toLocal().toString().split(' ')[0],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            imageBox(p.front),
                            imageBox(p.side),
                            imageBox(p.back),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
