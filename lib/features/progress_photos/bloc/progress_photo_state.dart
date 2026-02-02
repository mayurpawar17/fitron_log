import '../data/model/progress_photo.dart';

abstract class ProgressPhotoState {}

class ProgressPhotoLoading extends ProgressPhotoState {}

class ProgressPhotoLoaded extends ProgressPhotoState {
  final List<ProgressPhoto> photos;
  ProgressPhotoLoaded(this.photos);
}

class ProgressPhotoError extends ProgressPhotoState {
  final String message;
  ProgressPhotoError(this.message);
}
