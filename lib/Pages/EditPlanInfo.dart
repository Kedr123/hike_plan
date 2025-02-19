import 'package:flutter/material.dart';
import 'package:hike_plan/LocalDataBase/Database.dart';
import 'package:hike_plan/Models/NavPanelEditPlan.dart';
import 'package:provider/provider.dart';

class EditPlanInfo extends StatefulWidget {
  const EditPlanInfo({super.key, required this.route_id});


  final int route_id;
  @override
  State<EditPlanInfo> createState() => _EditPlanInfoState();
}

class _EditPlanInfoState extends State<EditPlanInfo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DBProvider>(
        builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Color(0xFF4F4F4F),
    bottomNavigationBar: NavPanelEditPlan(
      isMap: false,
    active_item: 2,
    isVisible: widget.route_id == null ? false : true,
    route_id: widget.route_id,
    setInstrument: (int item)=>setState(() {
    // bottomMenuActiveItem=item;
    }),
    ),));
  }
}
