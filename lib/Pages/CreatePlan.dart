import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hike_plan/Models/NavPanelCreatePlan.dart';
import 'package:latlong2/latlong.dart';

class CreatePlan extends StatefulWidget {
  const CreatePlan({super.key});

  @override
  State<CreatePlan> createState() => _CreatePlanState();
}

class _CreatePlanState extends State<CreatePlan> {
  List<LatLng> mapPoints = [
    
  ];


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
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF4F4F4F),
      bottomNavigationBar: NavPanelCreatePlan(active_item: 1),
      body: FlutterMap(
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
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.flutter_map_example',
            ),
            MarkerLayer(
              markers: markers,
            ),
          ]
      ),
    );
  }
}
