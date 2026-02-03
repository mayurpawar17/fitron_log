import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/progress_photo.dart';

class ProgressPhotoDB {
  static final ProgressPhotoDB instance = ProgressPhotoDB._internal();
  ProgressPhotoDB._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _init();
    return _db!;
  }

  Future<Database> _init() async {
    final path = join(await getDatabasesPath(), 'progress_photos.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE photos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT,
            front TEXT,
            side TEXT,
            back TEXT
          )
        ''');
      },
    );
  }

  Future<List<ProgressPhoto>> getAll() async {
    final db = await database;
    final res = await db.query('photos', orderBy: 'date DESC');
    return res.map((e) => ProgressPhoto.fromMap(e)).toList();
  }

  Future<void> insert(ProgressPhoto photo) async {
    final db = await database;
    await db.insert('photos', photo.toMap());
  }
}
