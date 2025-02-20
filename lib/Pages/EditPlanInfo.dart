import 'package:flutter/material.dart';
import 'package:hike_plan/LocalDataBase/Database.dart';
import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:hike_plan/Modules/EditPlanInfoModule.dart';
import 'package:hike_plan/Modules/NavPanelEditPlan.dart';
import 'package:hike_plan/Modules/PreviewPlanInfo.dart';
import 'package:provider/provider.dart';

class EditPlanInfo extends StatefulWidget {
  const EditPlanInfo({super.key, required this.route, required this.upRoute});

  final RoutesModel route;
  final Function upRoute;

  @override
  State<EditPlanInfo> createState() => _EditPlanInfoState();
}

class _EditPlanInfoState extends State<EditPlanInfo> {
  int index = 0;
  void setIndex(int index){
    setState(() {
      this.index = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<DBProvider>(
        builder: (context, value, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              extendBody: true,
              backgroundColor: Color(0xFF4F4F4F),
              body: IndexedStack(
                index: index,
                children: [
                  PreviewPlanInfo(route: widget.route, setIndex:(value)=> setIndex(value),),
                  if(widget.route.id!=null)EditPlanInfoModule(route: widget.route, setIndex:(value)=> setIndex(value), upRoute:widget.upRoute)
                ],
              ),

                  // bottomNavigationBar: NavPanelEditPlan(
                  //   isMap: false,
                  // active_item: 2,
                  // isVisible: widget.route_id == null ? false : true,
                  // route_id: widget.route_id,
                  // setInstrument: (int item)=>setState(() {
                  // // bottomMenuActiveItem=item;
                  // }),
                  ),
            );
  }
}
