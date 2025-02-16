import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPreview extends StatefulWidget {
  const MapPreview({super.key});

  @override
  State<MapPreview> createState() => _MapPreviewState();
}

class _MapPreviewState extends State<MapPreview> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          initialCenter: const LatLng(55.755793, 37.617134),
          initialZoom: 5,
          // onTap: (tapPosition, point) => {
          //   setState(() {
          //     mapPoints.add(point);
          //     markers = _getMarkers(mapPoints);
          //   }),
          //
          //   print(point.toString())
          // },


        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.flutter_map_example',
          ),
          // MarkerLayer(
          //   markers: markers,
          // ),
        ]
    );
  }
}
