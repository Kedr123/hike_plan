

import 'dart:io';

import 'package:hike_plan/LocalDataBase/Controllers/PointsController.dart';
import 'package:hike_plan/LocalDataBase/Controllers/RoutesController.dart';
import 'package:hike_plan/LocalDataBase/Models/PointModel.dart';
import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{

  Database? db = null;

  DBProvider(String path_bd) {
    initDB(path_bd);
  }



  initDB(String path_bd) async {
    db = await openDatabase(path_bd);
    print(db?.getVersion().toString());

    if(!db!.isOpen) return;

    var result = await db?.rawQuery("SELECT * FROM sqlite_master where type='table'");
    print(result?.length);
    result?.forEach((var item)=>print(item));

    if(result!.length>1) return;

    await db?.execute("CREATE TABLE routes ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "info TEXT"
          ")");
    await db?.execute("CREATE TABLE points ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        "info TEXT,"
        "x REAL,"
        "y REAL,"
        "type TEXT,"
        "route_id INTEGER,"
        "FOREIGN KEY(route_id) REFERENCES routes(id) ON DELETE CASCADE"
        ")");
  }

  comand() async{

    var res_c = await PointsController.create(db as Database, new PointModel(null, "title", "info", 2.5, 3.2, "point", 6));
    print('create');
    print(res_c.getString());
    print('create end');
    
    var res = await PointsController.getAll(db as Database);
    print('getAll');
    res?.forEach((item)=>print(item.getString()));
    print("len - "+res.length.toString());
    print('getAll End');
    
    var res_g = await PointsController.get(db as Database, res_c.id as int);
    print('get');
    print(res_g.getString());
    print('get End');

    res_c.title="up";
    var res_u = await PointsController.update(db as Database, res_c);
    print('up');
    print(res_u.getString());
    print('up End');

    print('del');
    var res_d = await PointsController.delete(db as Database, res_c);
    var res_gA2 = await PointsController.getAll(db as Database);

    print("len - "+res_gA2.length.toString());

    print('del End');

  }

  deleteDataBase(){
    db?.delete('points');
    db?.delete('routes');
  }
}

