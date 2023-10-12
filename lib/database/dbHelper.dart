import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../model/task.dart';

class DBHelper {
  //======================================================= initDb
  //================================================================
  // const
  static const databaseName = "zaki.db";
  static const databaseVersion = 1;
  static Database? DB;

  // varaible
  static const columnId = 'id';
  static const columnNote = 'note';
  static const columnTitle = 'title';
  static const columnColor = 'color';
  static const tableName = 'tasks';

  //----------------- initDb
  //-------------------------
  static initDb() async {
    //if
    if (DB != null) {
      print("---> database has already been initialized");
      return;
    }
    //else
    try {
      String path = await getDatabasesPath() + databaseName;
      DB = await openDatabase(
        path,
        version: databaseVersion,
        onCreate: _onCreate,
      );
      print("---> init database success");
    } catch (e) {
      print("---> Error For initDb $e");
    }
  }

  //-----------------  onCreate
  static _onCreate(Database dbase, int version) async {
    Batch batch_ = dbase.batch();
    batch_.execute(''' 
      CREATE TABLE IF NOT EXISTS $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTitle TEXT,
      $columnNote TEXT,
      $columnColor INTEGER


     )''');

    await batch_.commit();
    print("---> onCreate batch database success");
  }

  //======================================================= RawQuery
  //================================================================
  //------------------- insert
  static Future<int> insert(Task? task) async {
    print("---> insert succes");
    return await DB!.insert(tableName, task!.toJson_());
  }

  //------------------- select
  static Future<List<Map<String, dynamic>>> query() async {
    print("---> Query succes");
    return await DB!.query(tableName);
  }

  //------------------- deleteAll
  static Future<int> deleteAll() async {
    print("---> deleteAll Task succes");
    return await DB!.delete(tableName);
  }

  //------------------- delete
  static Future<int> delete(Task task) async {
    print("---> delete succes");
    return await DB!.delete(tableName, where: 'id = ${task.id}');
  }

  //------------------- update
  static Future<int> update(int newColor, int Id_) async {
    print("---> update success");
    return await DB!.rawUpdate('''
      UPDATE tasks
      SET color =$newColor
      WHERE id = $Id_
    ''');
  }

  //------------------- deleteDb
  static mydeleteDatabase() async {
    String path = await getDatabasesPath() + databaseName;
    await deleteDatabase(path);
    print("---> delete DB succes");
  }
}
