import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProgressPhotoDB {
  static final ProgressPhotoDB instance = ProgressPhotoDB._internal();
  ProgressPhotoDB._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'progress_photos.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE progress_photos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT NOT NULL,
            front_path TEXT,
            side_path TEXT,
            back_path TEXT,
            note TEXT
          )
        ''');
      },
    );
  }
}
