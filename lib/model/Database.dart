// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null && _database!.isOpen) {
      return _database!;
    }

    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'tasks.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            desc TEXT
          )
        ''');
      },
    );

    return _database!;
  }

  Future<void> insertTask(String title, String desc) async {
    Database db = await database;

    await db.insert(
      'tasks',
      {'title': title, 'desc': desc},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    Database db = await database;

    return await db.query('tasks');
  }

  Future<Map<String, dynamic>?> getTaskById(int id) async {
    Database db = await database;

    List<Map<String, dynamic>> result = await db.query(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.isNotEmpty ? result.first : null;
  }

  Future<void> updateTaskById(
      dynamic id, String newTitle, String newDesc) async {
    Database db = await database;

    await db.update(
      'tasks',
      {'title': newTitle, 'desc': newDesc},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTaskById(dynamic id) async {
    Database db = await database;

    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
