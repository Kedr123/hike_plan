import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hike_plan/Components/UI/Inputs/InputsForm1.dart';
import 'package:hike_plan/Components/UI/Inputs/InputsMultiLineForm1.dart';
import 'package:hike_plan/Models/NavPanelEditPlan.dart';
import 'package:latlong2/latlong.dart';

class EditPlan extends StatefulWidget {
  const EditPlan({super.key, this.route_id});


  final int? route_id;

  @override
  State<EditPlan> createState() => _EditPlanState();
}

class _EditPlanState extends State<EditPlan> {


  List<LatLng> mapPoints = [];

  /// Метод генерации маркеров
  List<Marker> _getMarkers(List<LatLng> mapPoints) {
    return List.generate(
      mapPoints.length,
      (index) => Marker(
        point: mapPoints[index],
        child: Text("X"),
        width: 10,
        height: 10,
        alignment: Alignment.center,
      ),
    );
  }

  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {

    // setState(() {
    //   route_id = rcvdData['route_id'];
    // });

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Color(0xFF4F4F4F),
        bottomNavigationBar: NavPanelEditPlan(
            active_item: 2, isVisible: widget.route_id == null ? false : true),
        body: Stack(
          children: [

            FlutterMap(
                mapController: MapController(),
                options: MapOptions(
                  initialCenter: const LatLng(55.755793, 37.617134),
                  initialZoom: 5,
                  onTap: (tapPosition, point) => {
                    setState(() {
                      mapPoints.add(point);
                      markers = _getMarkers(mapPoints);
                    }),
                    print(point.toString())
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.flutter_map_example',
                  ),
                  MarkerLayer(
                    markers: markers,
                  ),
                ]),
            if(widget.route_id==null)
              Container(

                margin: EdgeInsets.fromLTRB(10, 100, 10, 0),
                padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                width: double.maxFinite,
                height: 500,
                decoration: BoxDecoration(
                  color: Color(0xFF696969),
                  borderRadius:BorderRadius.all(Radius.circular(5))
                ),
                child: Column(

                  children: [
                    Text(widget.route_id.toString()),
                    InputsForm1(title: "Название маршрута", changeValue: ()=>{}, error: ""),
                    InputsMultiLineForm1(title: "Описание", changeValue: ()=>{}, error: ""),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      // spacing:180,
                      children: [
                        ElevatedButton(
                          onPressed: () => {Navigator.pushNamed(context, "/HikePlans")},
                          child: Text("Отмена",
                              style: TextStyle(
                                  color: Color(0xFFC36B6B))),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF4F4F4F),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color(0xFFC36B6B),
                                      width: 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5)))),
                        ),
                        ElevatedButton(
                          onPressed: () => {Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => EditPlan(route_id: 1,)))},
                          child: Text("Создать",
                              style: TextStyle(
                                  color: Color(0xFF75B872))),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF4F4F4F),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color(0xFF75B872),
                                      width: 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5)))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ));
  }
}
