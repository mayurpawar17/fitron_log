import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/progress_photo_bloc.dart';
import '../bloc/progress_photo_event.dart';
import '../data/model/progress_photo.dart';

class AddProgressPhotoSheet extends StatefulWidget {
  const AddProgressPhotoSheet({super.key});

  @override
  State<AddProgressPhotoSheet> createState() =>
      _AddProgressPhotoSheetState();
}

class _AddProgressPhotoSheetState extends State<AddProgressPhotoSheet> {
  String? front, side, back;

  Future<String?> _pickImage() async {
    final image =
    await ImagePicker().pickImage(source: ImageSource.camera);
    return image?.path;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _btn('Capture Front', () async {
              front = await _pickImage();
              setState(() {});
            }),
            _btn('Capture Side', () async {
              side = await _pickImage();
              setState(() {});
            }),
            _btn('Capture Back', () async {
              back = await _pickImage();
              setState(() {});
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: front == null && side == null && back == null
                  ? null
                  : () {
                context.read<ProgressPhotoBloc>().add(
                  AddProgressPhoto(
                    ProgressPhoto(
                      date: DateTime.now(),
                      frontPath: front,
                      sidePath: side,
                      backPath: back,
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }

  Widget _btn(String text, VoidCallback onTap) {
    return ListTile(
      leading: const Icon(Icons.camera_alt),
      title: Text(text),
      onTap: onTap,
    );
  }
}
