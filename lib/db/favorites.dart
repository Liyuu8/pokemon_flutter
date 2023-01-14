import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:pokemon_flutter/models/fav_poke.dart';
import '../const/db.dart';

class FavoritesDB {
  static Future<Database> openDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), favFileName),
      onCreate: (db, version) =>
          db.execute('CREATE TABLE $favTableName(id INTEGER PRIMARY KEY)'),
      version: 1,
    );
  }

  static Future<void> create(FavPoke favPoke) async {
    Database db = await openDB();

    await db.insert(
      favTableName,
      favPoke.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<FavPoke>> read() async {
    Database db = await openDB();
    final List<Map<String, dynamic>> maps = await db.query(favTableName);

    return List.generate(
      maps.length,
      (index) => FavPoke(pokeId: maps[index]['id']),
    );
  }

  static Future<void> delete(int pokeId) async {
    Database db = await openDB();

    await db.delete(favTableName, where: 'id = ?', whereArgs: [pokeId]);
  }
}
