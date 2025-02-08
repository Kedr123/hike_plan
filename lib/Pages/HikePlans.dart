import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hike_plan/Models/NavigationPanel.dart';
import 'package:latlong2/latlong.dart';

class HikePlans extends StatefulWidget {
  const HikePlans({super.key});

  @override
  State<HikePlans> createState() => _HikePlansState();
}

class _HikePlansState extends State<HikePlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFF4F4F4F),
        bottomNavigationBar: NavigationPanel(active_item: 1),
        body: Container(

        ),
      floatingActionButton: Padding(
    padding: const EdgeInsets.only(bottom: 25.0),
    child: FloatingActionButton(
        onPressed: ()=>{},
        backgroundColor: Color(0xFF636363),
        hoverColor: Colors.white,
        foregroundColor: Colors.white,
        focusColor: Colors.white,
        splashColor: Color(0x80FFFFFF),
        elevation: 0.5,
        tooltip: '',
        child: const Icon(Icons.add),
      ),

    ));
  }
}
