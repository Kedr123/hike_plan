import 'dart:math';

import 'package:hike_plan/LocalDataBase/Models/PointModel.dart';
import 'package:hike_plan/LocalDataBase/Models/PointModel.dart';
import 'package:sqflite/sqflite.dart';

class PointsController {
  static Future<PointModel> get(Database db, int id) async {
    var result =
        await db.rawQuery(('SELECT * FROM points WHERE id=' + id.toString()));

    return new PointModel(result.first['id'] as int,
        result.first['title'] as String, result.first['info'] as String,
        result.first['x'] as double,
        result.first['y'] as double,
        result.first['type'] as String,
        result.first['route_id'] as int);
  }

  static Future<List<PointModel>> getAll(Database db) async {
    var result = await db.rawQuery('SELECT * FROM points');
    List<PointModel> points = [];
    result.forEach((element) => points.add(new PointModel(
          element['id'] as int,
          element['title'] as String,
          element['info'] as String,
          element['x'] as double,
          element['y'] as double,
          element['type'] as String,
          element['route_id'] as int
        )));
    return points;
  }

  static Future<PointModel> create(Database db, PointModel point) async {
    var res = await db.rawInsert('INSERT INTO points (title, info, x, y, type, route_id) VALUES (\'' +
        point.title.toString() + '\', \'' +
        point.info.toString() + '\', \'' +
        point.x.toString() + '\', \'' +
        point.y.toString() + '\', \'' +
        point.type.toString() + '\', \'' +
        point.route_id.toString() + '\')');

    return new PointModel(res, point.title.toString(), point.info.toString(),
        point.x, point.y, point.type.toString(), point.route_id
    );
  }

  static Future<PointModel> update(Database db, PointModel point) async {
    var res = await db.rawUpdate('UPDATE points SET title=\'' +
        point.title.toString() +
        '\', info=\'' +
        point.info.toString() +
        '\' WHERE id=' +
        point.id.toString());
    return new PointModel(point.id, point.title.toString(), point.info.toString(),
        point.x, point.y, point.type.toString(), point.route_id
    );
  }

  static delete(Database db, PointModel point) async {
    var res = await db
        .rawDelete('DELETE FROM points WHERE id=' + point.id.toString());
    print(res);
  }
}
