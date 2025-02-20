import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hike_plan/LocalDataBase/Controllers/RoutesController.dart';
import 'package:hike_plan/LocalDataBase/Database.dart';
import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:hike_plan/Modules/NavPanelEditPlan.dart';
import 'package:hike_plan/Pages/EditPlan.dart';
import 'package:hike_plan/Pages/EditPlanInfo.dart';
import 'package:provider/provider.dart';

class Plun extends StatefulWidget {
  const Plun({super.key, this.route_id});

  final int? route_id;

  @override
  State<Plun> createState() => _PlunState();
}

class _PlunState extends State<Plun> {
  int index = 0;
  int bottomMenuIndex = 0;
  RoutesModel route = RoutesModel(null, "", "");

  void getRoute() async{
    if(widget.route_id==null) return;

    var res = await RoutesController.get(Provider.of<DBProvider>(context,listen: false).db, widget.route_id as int);
    setState(() {
      route = res;
    });
  }

  setIndex(int index, int bottomMenuIndex){
    if(bottomMenuIndex==3){
      Navigator.pop(context);
      return;
    }
    setState(() {
      this.index = index;
      this.bottomMenuIndex = bottomMenuIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=> getRoute());
  }

  @override
  Widget build(BuildContext context) {
    return
        Consumer<DBProvider>(builder: (context, value, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
          body: IndexedStack(
            index: index,
            children: [
              EditPlan(route_id: widget.route_id,navPanelEditPlan_item: bottomMenuIndex,),
              if(widget.route_id!=null)
                EditPlanInfo(route: route, upRoute:getRoute)
            ],
          ),
          bottomNavigationBar: NavPanelEditPlan(
            active_item: bottomMenuIndex,
            isVisible: widget.route_id==null?false:true,
            setInstrument: (int item) => setIndex(
              item==0||item==1?0:1,item
            )),

        ));
  }
}
