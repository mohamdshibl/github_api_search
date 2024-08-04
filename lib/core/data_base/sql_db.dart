

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {

  static Database? _db;

  Future<Database?> get getInstance async{
    if (_db == null) {
      _db = await init();
      return _db;
    }else {
      return _db;
    }
  }

  init() async{

    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'favorite.db');

// open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              '''
      CREATE TABLE Favorite (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT NOT NULL, 
        avatarUrl TEXT NOT NULL
      );
      ''');
        });
    print('table createdddddddddddddddddddddddddddddd');
    return database;

  }

  inquiry(String sqlTxt) async{
    Database? db = await getInstance;
    // Get the records
    List<Map> list = await db!.rawQuery(sqlTxt);
    return list;
  }

  insert(String sqlTxt) async{

    Database? db = await getInstance;
    int count = await db!.rawInsert(sqlTxt);
    return count;
  }
  update(String sqlTxt) async{

    Database? db = await getInstance;
    int count = await db!.rawUpdate(sqlTxt);
    return count;
  }
  delete(String sqlTxt) async{

    Database? db = await getInstance;
    int count = await db!.rawDelete(sqlTxt);
    return count;
  }
}

