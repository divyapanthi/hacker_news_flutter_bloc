import 'dart:io';
import 'package:hacker_news/src/core/constants.dart';
import 'package:hacker_news/src/core/sources.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart' as path;

class NewsDbProvider implements Source, Cache{
  Database? _db;

  NewsDbProvider() {
    _init();
  }

  Future<void> _init() async{
    Directory dir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(dir.path, DB_NAME);

    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database newDb, int version){
        Batch batch = newDb.batch();
        batch.execute("""
          CREATE TABLE $ITEM_TABLE(
            id INT PRIMARY KEY,
            by TEXT,
            descendants INTEGER,
            parent INTEGER,
            deleted INTEGER,
            dead INTEGER,
            kids BLOB,
            score INTEGER,
            time INTEGER,
            title TEXT,
            type TEXT,
            url TEXT
          )
        """);
        batch.commit();
      }
    );
  }

  @override
  Future<int> insertItem(ItemModel item) async{
    if(_db == null) await _init();
    return _db!.insert(
        ITEM_TABLE, item.toDb()
    );
  }

  @override
  Future<ItemModel?> fetchItem(int id) async{
    if(_db == null) await _init();
    // final data = await _db!.rawQuery("SELECT * FROM $ITEM_TABLE where id = $id");
    final data = await _db!.query(
        ITEM_TABLE,
        where : "id = ? ",
        whereArgs: [id]
    );

    if(data.length!=1) return null;
    return ItemModel.fromDb(data.first);
  }

  @override
  Future<List<int>> fetchTopIds() async {
    // TODO: implement fetchTopIds
    return [];
  }
}