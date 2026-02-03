import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/db/progress_photo_db.dart';
import '../data/model/progress_photo.dart';

class AddProgressPhotoSheet extends StatefulWidget {
  final VoidCallback onSaved;
  const AddProgressPhotoSheet({super.key, required this.onSaved});

  @override
  State<AddProgressPhotoSheet> createState() =>
      _AddProgressPhotoSheetState();
}

class _AddProgressPhotoSheetState extends State<AddProgressPhotoSheet> {
  String? front, side, back;

  Future pick(Function(String) onPick) async {
    final img =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (img != null) {
      onPick(img.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Capture Front"),
              onTap: () => pick((v) => front = v),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Capture Side"),
              onTap: () => pick((v) => side = v),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Capture Back"),
              onTap: () => pick((v) => back = v),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: front == null && side == null && back == null
                  ? null
                  : () async {
                await ProgressPhotoDB.instance.insert(
                  ProgressPhoto(
                    date: DateTime.now(),
                    front: front,
                    side: side,
                    back: back,
                  ),
                );
                widget.onSaved();
                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
