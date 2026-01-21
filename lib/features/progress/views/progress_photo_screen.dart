import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../data/progress_photo.dart';
import 'full_photo_view_screen.dart';

class ProgressPhotoScreen extends StatefulWidget {
  const ProgressPhotoScreen({super.key});

  @override
  State<ProgressPhotoScreen> createState() => _ProgressPhotoScreenState();
}

class _ProgressPhotoScreenState extends State<ProgressPhotoScreen> {
  final ImagePicker _picker = ImagePicker();
  List<ProgressPhoto> photos = [];

  Future<void> addPhoto(ImageSource source) async {
    final picked = await _picker.pickImage(source: source, imageQuality: 85);

    if (picked == null) return;

    final dir = await getApplicationDocumentsDirectory();
    final fileName = "progress_${DateTime.now().millisecondsSinceEpoch}.jpg";
    final savedImage = await File(picked.path).copy('${dir.path}/$fileName');

    setState(() {
      photos.insert(
        0,
        ProgressPhoto(path: savedImage.path, date: DateTime.now()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photo = photos[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullPhotoViewScreen(photo: photo),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(File(photo.path), fit: BoxFit.cover),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_a_photo),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text("Camera"),
                  onTap: () {
                    Navigator.pop(context);
                    addPhoto(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text("Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    addPhoto(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
