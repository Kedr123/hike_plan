import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hike_plan/Models/NavigationPanel.dart';

class HikePlans extends StatefulWidget {
  const HikePlans({super.key});

  @override
  State<HikePlans> createState() => _HikePlansState();
}

class _HikePlansState extends State<HikePlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF4F4F4F),
        bottomNavigationBar: NavigationPanel(active_item: 1)
    );
  }
}
