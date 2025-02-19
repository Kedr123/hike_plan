import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:hike_plan/Components/UI/Inputs/InputsForm1.dart';
import 'package:hike_plan/Components/UI/Inputs/InputsMultiLineForm1.dart';
import 'package:hike_plan/LocalDataBase/Controllers/PointsController.dart';
import 'package:hike_plan/LocalDataBase/Controllers/RoutesController.dart';
import 'package:hike_plan/LocalDataBase/Database.dart';
import 'package:hike_plan/LocalDataBase/Models/PointModel.dart';
import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:hike_plan/Models/NavPanelEditPlan.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class EditPlan extends StatefulWidget {
  const EditPlan({super.key, this.route_id, this.navPanelEditPlan_item});

  final int? route_id;
  final int? navPanelEditPlan_item;

  @override
  State<EditPlan> createState() => _EditPlanState();
}

class _EditPlanState extends State<EditPlan> {
  List<LatLng> mapPoints = [];
  List<PointModel> FullPoints = [];

  /// Метод генерации маркеров
  List<DragMarker> _getMarkers(List<LatLng> mapPoints) {
    return List.generate(
      mapPoints.length,
      (index) => DragMarker(
          point: mapPoints[index],
          builder: (context, pos, isDragging) => Icon(
                Icons.location_on,
                size: 50,
              ),
          onDragUpdate: (details, latLng) => {streemSetPosition(index, latLng)},
          onDragEnd: (details, latLng) => setPosition(index, latLng),
          onTap: (latLng) => deletePoint(index),
          // offset: Offset(50.0, 50.0),
          // dragOffset: Offset(50, 50.0),
          size: Size(50, 50),
          alignment: Alignment(0, -0.75)

          // child: Text("X"),
          // width: 10,
          // height: 10,
          // alignment: Alignment.center,
          ),
    );
  }

  List<DragMarker> markers = [];

  String title = "";
  String titleError = "";
  String info = "";

  void setTitle(String value) {
    setState(() {
      title = value;
    });
  }

  void setInfo(String value) {
    setState(() {
      info = value;
    });
  }

  void createPlan() async {
    if (title.replaceAll(" ", "").isEmpty) {
      setState(() {
        titleError = "Данное поле должно быть заполнено";
      });
      return;
    }

    var res = await RoutesController.create(
        Provider.of<DBProvider>(context, listen: false).db,
        new RoutesModel(null, title, info));
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => EditPlan(route_id: res.id)));
  }

  final MapController _mapController = MapController();

  void addPoint(LatLng point) async {
    mapPoints.add(point);
    final currentCenter = _mapController.camera.center;
    final currentZoom = _mapController.camera.zoom;
    var newPoint = await PointsController.create(
        Provider.of<DBProvider>(context, listen: false).db,
        new PointModel(null, "", "", point.latitude, point.longitude, "",
            widget.route_id as int, 0));
    FullPoints.add(newPoint);
    setState(() {
      markers = _getMarkers(mapPoints);
    });
  }

  void getPoints() async {
    if (widget.route_id == null) return;
    var res = await PointsController.getAll(
        Provider.of<DBProvider>(context, listen: false).db,
        widget.route_id as int);
    print("getPoints");
    res.forEach((el) => {
          mapPoints.add(LatLng(el.x, el.y)),
          FullPoints.add(el),
          print(el.getString())
        });
    setState(() {
      markers = _getMarkers(mapPoints);
    });
    print("end getPoints");
  }

  void deletePoint(int index) async {
    if (bottomMenuActiveItem != 1) return;
    var point = FullPoints[index];
    await PointsController.delete(
        Provider.of<DBProvider>(context, listen: false).db, point);
    FullPoints.removeAt(index);
    mapPoints.removeAt(index);
    setState(() {
      markers = _getMarkers(mapPoints);
    });
  }

  void setPosition(int index, LatLng latLng) async {
    var active_point = FullPoints[index];
    active_point.x = latLng.latitude;
    active_point.y = latLng.longitude;

    await PointsController.update(
        Provider.of<DBProvider>(context, listen: false).db, active_point);
    var upPoint = await PointsController.get(
        Provider.of<DBProvider>(context, listen: false).db,
        active_point.id as int);
    mapPoints[index] = new LatLng(upPoint.x, upPoint.y);
    setState(() {
      markers = _getMarkers(mapPoints);
    });

    print("end");
    print(latLng.toString());
    print(upPoint.getString());
  }

  void streemSetPosition(int index, LatLng latLng) {
    mapPoints[index] = latLng;
    setState(() {
      markers = _getMarkers(mapPoints);
    });
    print("streem");
    print(latLng.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          bottomMenuActiveItem = widget.navPanelEditPlan_item == null
              ? 0
              : widget.navPanelEditPlan_item as int,
          getPoints()
        });
  }

  final LayerHitNotifier hitNotifier = ValueNotifier(null);

  void tupLine() {
    final LayerHitResult? hitResult = hitNotifier.value;
    if (hitResult == null) return;
    for (final hitValue in hitResult.hitValues) {
      print(hitValue.toString());
    }
  }

  int bottomMenuActiveItem = 0;

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   route_id = rcvdData['route_id'];
    // });

    hitNotifier.addListener(() =>
        {print(hitNotifier.value?.hitValues.length.toString()), print("line")});
    return Consumer<DBProvider>(
        builder: (context, value, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            backgroundColor: Color(0xFF4F4F4F),
            bottomNavigationBar: NavPanelEditPlan(
              isMap: true,
              active_item: bottomMenuActiveItem,
              isVisible: widget.route_id == null ? false : true,
              route_id: widget.route_id,
              setInstrument: (int item) => setState(() {
                bottomMenuActiveItem = item;
              }),
            ),
            body: Stack(
              children: [
                FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: const LatLng(55.755793, 37.617134),
                      initialZoom: 5,
                      onTap: (tapPosition, point) => {addPoint(point)},
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.flutter_map_example',
                      ),
                      if (mapPoints.length > 0)
                        PolylineLayer(hitNotifier: hitNotifier, polylines: [
                          Polyline(
                            points: mapPoints,
                            color: Colors.blue,
                            strokeWidth: 5,
                          )
                        ]),
                      DragMarkers(
                        markers: markers,
                      ),
                    ]),
                if (widget.route_id == null)
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 100, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 25, 15, 20),
                    width: double.maxFinite,
                    height: 480,
                    decoration: BoxDecoration(
                        color: Color(0xFF696969),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        InputsForm1(
                            title: "Название маршрута",
                            changeValue: (value) => {setTitle(value)},
                            error: titleError),
                        InputsMultiLineForm1(
                            title: "Описание",
                            changeValue: (value) => {setInfo(value)},
                            error: ""),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          // spacing:180,
                          children: [
                            ElevatedButton(
                              onPressed: () =>
                                  {Navigator.pushNamed(context, "/HikePlans")},
                              child: Text("Отмена",
                                  style: TextStyle(color: Color(0xFFC36B6B))),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF4F4F4F),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Color(0xFFC36B6B), width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                            ),
                            ElevatedButton(
                              // onPressed: () => {Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => EditPlan(route_id: 1,)))},
                              onPressed: () => {createPlan()},
                              child: Text("Создать",
                                  style: TextStyle(color: Color(0xFF75B872))),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF4F4F4F),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Color(0xFF75B872), width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            )));
  }
}
