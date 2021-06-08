import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/shortened_url.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  DatabaseHelper._internal();

  static const _databaseName = "'shortened_url_database.db'";
  static const _databaseVersion = 1;
  static const table = 'urls';
  static const columnId = '_id';
  static const columnOriginalLink = 'original_link';
  static const columnShortLink = 'short_link';

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnOriginalLink TEXT NOT NULL,
            $columnShortLink TEXT NOT NULL
          )
          ''');
  }

  Future insertUrl(ShortenedUrl url) async {
    final db = await database;

    return await db?.insert(
          table,
          url.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
  }

  Future<List<ShortenedUrl>?> getUrlList() async {
    final db = await database;

    if (db != null) {
    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(
      maps.length,
      (i) {
        return ShortenedUrl(
          id: maps[i][columnId],
          originalLink: maps[i][columnOriginalLink],
          shortLink: maps[i][columnShortLink],
        );
      },
    );
    }
  }

  Future<void> deleteUrl(int id) async {
    final db = await database;

    await db?.delete(
      table,
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }
}
