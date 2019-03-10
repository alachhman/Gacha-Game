import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
// import 'dart:convert';
import 'dataModel.dart';
import 'package:flutter/material.dart';

// Copy of the user's current units
// Seperate table of their team

class testLocalDB extends StatelessWidget {
  var randomClient = Client(unit_1: "Kenny", unit_2: "Jeannite", unit_3: 'PP');
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<Client>>(
      future: DBProvider.db.getAllClients(),
      builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
        if(snapshot.hasData) {
          Client item = snapshot.data[0];
          DBProvider.db.newClient(randomClient);
          print(item.unit_2);
          return Text(
              item.unit_2+ ' ' + item.unit_1
          );
        }
      },
    );
  }
}


class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE user_units ("
              "id INTEGER PRIMARY KEY,"
              "unit_1 TEXT,"
              "unit_2 TEXT,"
              "unit_3 TEXT"
              ")");
        });
  }

  newClient(Client newClient) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM user_units");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into user_units (id,unit_1,unit_2,unit_3)"
            " VALUES (?,?,?,?)",
        [id, newClient.unit_1, newClient.unit_2, newClient.unit_3]);
    return raw;
  }

  getClient(int id) async {
    final db = await database;
    var res = await db.query("user_units", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  }

  Future<List<Client>> getAllClients() async {
    final db = await database;
    var res = await db.query("user_units");
    List<Client> list =
    res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }


}