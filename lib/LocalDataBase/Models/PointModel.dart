class PointModel {
  int? id = null;
  String? title;
  String? info;
  late double x;
  late double y;
  late String type;
  late int route_id;

  PointModel(int? id, String title, String info, double x, double y,
      String type, int route_id) {
    this.id = id;
    this.title = title;
    this.info = info;
    this.x = x;
    this.y = y;
    this.type = type;
    this.route_id = route_id;
  }

  getString() {
    return "{ 'id': " + this.id.toString() +
        ", 'title': " + this.title.toString() +
        ", 'info': " + this.info.toString() +
        ", 'x': " + this.x.toString() +
        ", 'y': " + this.y.toString() +
        ", 'type': " + this.type.toString() +
        ", 'route_id': " + this.route_id.toString() +
        "}";
  }
}
