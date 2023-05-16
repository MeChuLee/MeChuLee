import 'record.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(join(await getDatabasesPath(), 'Record.db'),
        onCreate: (db, version) => _createDb(db), version: 1);
    return _db;
  }

  static void _createDb(Database db) {
    db.execute(
      "CREATE TABLE Record(id INTEGER PRIMARY KEY AUTOINCREMENT, date STRING, menuId INTEGER)",
    );
  }

  Future<void> insertRecord(Record record) async {
    final db = await database;

    await db.insert("Record", record.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Record>> getAllRecord() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Record');

    return List.generate(maps.length, (i) {
      return Record(
        id: maps[i]['id'],
        date: maps[i]['date'],
        menuId: maps[i]['menuId'],
      );
    });
  }

  Future<dynamic> getRecord(int id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = (await db.query(
      'Record',
      where: 'id = ?',
      whereArgs: [id],
    ));

    return maps.isNotEmpty ? maps : null;
  }

  Future<void> updateRecord(Record record) async {
    final db = await database;

    await db.update(
      "Record",
      record.toMap(),
      where: "id = ?",
      whereArgs: [record.id],
    );
  }

  Future<void> deleteRecord(int id) async {
    final db = await database;

    await db.delete(
      "Record",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}