import 'dart:math';

import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:sqflite/sqflite.dart';

class RoutesController{

  static Future<RoutesModel> get(Database db, int id) async{
    var result = await db.rawQuery(('SELECT * FROM routes WHERE id='+id.toString()));

    return new RoutesModel(result.first['id'] as int, result.first['title'] as String, result.first['info'] as String);
  }

  static Future<List<RoutesModel>> getAll(Database db) async{
    var result = await db.rawQuery('SELECT * FROM routes');
    List<RoutesModel> routes = [];
    result.forEach((element) => routes.add(new RoutesModel(element['id'] as int, element['title'] as String, element['info'] as String)));
    return routes;
  }

  static create(Database db, RoutesModel route) async{
      var res =await db.rawInsert('INSERT INTO routes (title, info) VALUES (\''+route.title.toString()+'\', \''+route.info.toString()+'\')');
      return new RoutesModel(res, route.title.toString(), route.info.toString());
  }

  static update(Database db, RoutesModel route) async{
    var res =await db.rawUpdate('UPDATE routes SET title=\''+route.title.toString()+'\', info=\''+route.info.toString()+'\' WHERE id='+route.id.toString());
    return new RoutesModel(route.id, route.title.toString(), route.info.toString());
  }

  static delete(Database db, RoutesModel route) async{
    var res = await db.rawDelete('DELETE FROM routes WHERE id='+route.id.toString());
    print(res);
  }
}