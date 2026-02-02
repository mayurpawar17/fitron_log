import '../data/model/progress_photo.dart';

abstract class ProgressPhotoEvent {}

class LoadProgressPhotos extends ProgressPhotoEvent {}

class AddProgressPhoto extends ProgressPhotoEvent {
  final ProgressPhoto photo;
  AddProgressPhoto(this.photo);
}

class DeleteProgressPhoto extends ProgressPhotoEvent {
  final int id;
  DeleteProgressPhoto(this.id);
}
