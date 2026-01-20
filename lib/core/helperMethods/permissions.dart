import 'package:permission_handler/permission_handler.dart';

Future<void> requestActivityPermission() async {
  if (await Permission.activityRecognition.isDenied) {
    await Permission.activityRecognition.request();
  }
}
