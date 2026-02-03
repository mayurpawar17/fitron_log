// import 'package:fitron_log/features/progress_photos/bloc/progress_photo_event.dart';
// import 'package:fitron_log/features/progress_photos/bloc/progress_photo_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../data/repo/progress_photo_repository.dart';
//
// class ProgressPhotoBloc extends Bloc<ProgressPhotoEvent, ProgressPhotoState> {
//   final ProgressPhotoRepository repo = ProgressPhotoRepository();
//
//   ProgressPhotoBloc() : super(ProgressPhotoLoading()) {
//     on<LoadProgressPhotos>((event, emit) async {
//       final photos = await repo.getAll();
//       emit(ProgressPhotoLoaded(photos));
//     });
//
//     on<AddProgressPhoto>((event, emit) async {
//       await repo.insert(event.photo);
//       add(LoadProgressPhotos());
//     });
//   }
// }
