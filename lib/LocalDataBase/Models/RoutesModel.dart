class RoutesModel {
  int? id;
  String? title;
  String? info;

  RoutesModel(int? id, String title, String? info) {
    this.id = id;
    this.title = title;
    this.info = info;
  }

  getString() {
    return "{ 'id': " +
        this.id.toString() +
        ", 'title': " +
        this.title.toString() +
        ", 'info': " +
        this.info.toString() +
        "}";
  }
}