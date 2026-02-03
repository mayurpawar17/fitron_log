// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// import '../../progress_photos/data/model/progress_photo.dart';
//
// class FullPhotoViewScreen extends StatelessWidget {
//   final ProgressPhoto photo;
//
//   const FullPhotoViewScreen({super.key, required this.photo});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${photo.date.day}/${photo.date.month}/${photo.date.year}"),
//       ),
//       body: Center(child: Image.file(File(photo.frontPath!))),
//     );
//   }
// }
