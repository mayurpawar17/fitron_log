import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WorkoutDB {
  static final WorkoutDB instance = WorkoutDB._();
  static Database? _db;

  WorkoutDB._();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'workout.db');

    return openDatabase(
      path,
      version: 2,
      onCreate: (db, _) async {
        await db.execute('''
        CREATE TABLE workouts (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          date TEXT,
          notes TEXT
        )
      ''');

        await db.execute('''
        CREATE TABLE exercises (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          workout_id INTEGER,
          name TEXT
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
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE workouts ADD COLUMN notes TEXT');
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> getWorkouts() async {
    final db = await database;

    return await db.rawQuery('''
    SELECT 
      w.id,
      w.date,
      w.notes,
      COUNT(e.id) as exerciseCount
    FROM workouts w
    LEFT JOIN exercises e ON e.workout_id = w.id
    GROUP BY w.id
    ORDER BY w.date DESC
  ''');
  }
}
