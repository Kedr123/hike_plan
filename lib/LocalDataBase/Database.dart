

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hike_plan/LocalDataBase/Controllers/PointsController.dart';
import 'package:hike_plan/LocalDataBase/Controllers/RoutesController.dart';
import 'package:hike_plan/LocalDataBase/Models/PointModel.dart';
import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider with ChangeNotifier {

  Database? _db = null;

  Database get db => _db as Database;

  set db(Database newDB) {
    _db = newDB;
  }

  DBProvider(){
    initDB();
  }

  initDB() async {
    _db = await openDatabase("test.db");
    print(_db?.getVersion().toString());

    if(!_db!.isOpen) return;

    var result = await _db?.rawQuery("SELECT * FROM sqlite_master where type='table'");
    print(result?.length);
    result?.forEach((var item)=>print(item));

    if(result!.length>1) return;

    await _db?.execute("CREATE TABLE routes ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "info TEXT"
          ")");
    await _db?.execute("CREATE TABLE points ("
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
    String info = "Предварительные выводы неутешительны: \nпостоянное информационно-пропагандистское обеспечение нашей деятельности, а также свежий взгляд на привычные вещи — безусловно открывает новые горизонты для новых предложений. Современные технологии достигли такого уровня, что экономическая повестка сегодняшнего дня играет важную роль в формировании новых предложений. Наше дело не так однозначно, как может показаться: базовый вектор развития позволяет оценить значение новых принципов формирования материально-технической и кадровой базы!Предварительные выводы неутешительны: постоянное информационно-пропагандистское обеспечение нашей деятельности, а также свежий взгляд на привычные вещи — безусловно открывает новые горизонты для новых предложений. Современные технологии достигли такого уровня, что экономическая повестка сегодняшнего дня играет важную роль в формировании новых предложений. Наше дело не так однозначно, как может показаться: базовый вектор развития позволяет оценить значение новых принципов формирования материально-технической и кадровой базы!";
    String title = "Название маршрута №";

    for(int i =0;i<1;i++){
      await RoutesController.create(db as Database, new RoutesModel(null, title, info+i.toString()));
    }

    // var res_c = await PointsController.create(db as Database, new PointModel(null, "title", "info", 2.5, 3.2, "point", 6));
    // print('create');
    // print(res_c.getString());
    // print('create end');
    //
    var res = await RoutesController.getAll(_db as Database);
    print('getAll');
    res?.forEach((item)=>print(item.getString()));
    print("len - "+res.length.toString());
    print('getAll End');
    //
    // var res_g = await PointsController.get(db as Database, res_c.id as int);
    // print('get');
    // print(res_g.getString());
    // print('get End');
    //
    // res_c.title="up";
    // var res_u = await PointsController.update(db as Database, res_c);
    // print('up');
    // print(res_u.getString());
    // print('up End');
    //
    // print('del');
    // var res_d = await PointsController.delete(db as Database, res_c);
    // var res_gA2 = await PointsController.getAll(db as Database);
    //
    // print("len - "+res_gA2.length.toString());
    //
    // print('del End');

  }

  deleteDataBase(){
    _db?.delete('points');
    _db?.delete('routes');
  }
}

