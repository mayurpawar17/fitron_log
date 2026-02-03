import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WorkoutDB {
  static final WorkoutDB instance = WorkoutDB._internal();
  WorkoutDB._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'workout.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE workouts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE exercises (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            workout_id INTEGER,
            name TEXT,
            rest_seconds INTEGER,
            note TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE sets (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            exercise_id INTEGER,
            reps INTEGER,
            weight REAL
          )
        ''');
      },
    );
  }
}
