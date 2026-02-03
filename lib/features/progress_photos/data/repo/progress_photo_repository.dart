import '../db/progress_photo_db.dart';
import '../model/progress_photo.dart';

class ProgressPhotoRepository {
  final dbProvider = ProgressPhotoDB.instance;

  Future<List<ProgressPhoto>> getAll() async {
    final db = await dbProvider.database;
    final result = await db.query('progress_photos', orderBy: 'date DESC');

    return result.map((e) => ProgressPhoto.fromMap(e)).toList();
  }

  Future<void> insert(ProgressPhoto photo) async {
    final db = await dbProvider.database;
    await db.insert('progress_photos', photo.toMap());
  }

  Future<void> delete(int id) async {
    final db = await dbProvider.database;
    await db.delete('progress_photos', where: 'id = ?', whereArgs: [id]);
  }
}
