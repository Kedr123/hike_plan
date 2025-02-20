import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hike_plan/LocalDataBase/Controllers/RoutesController.dart';
import 'package:hike_plan/LocalDataBase/Database.dart';
import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:hike_plan/Modules/HikePlanBlock.dart';
import 'package:hike_plan/Modules/NavigationPanel.dart';
import 'package:hike_plan/Pages/EditPlan.dart';
import 'package:hike_plan/Pages/Plun.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class HikePlans extends StatefulWidget {
  const HikePlans({super.key});

  @override
  State<HikePlans> createState() => _HikePlansState();
}

class _HikePlansState extends State<HikePlans> {
  List<RoutesModel> routes = [];

  setRoutes() async{
    // Provider.of<DBProvider>(context, listen: true).initDB();
    var res = await RoutesController.getAll(Provider.of<DBProvider>(context, listen: false).db);
    setState(() {
      routes = res;
    });
    print("setR");
  }

  void toPlan() async{
    Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => Plun(route_id: null,))).then((value) => setRoutes());
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=> setRoutes());
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero,()async{ await setRoutes();});
    // setRoutes();
    return Consumer<DBProvider>(builder: (context, value, child) => Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFF4F4F4F),
        bottomNavigationBar: NavigationPanel(active_item: 1),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: FloatingActionButton(
            onPressed: () => {
              toPlan()
            },
            backgroundColor: Color(0xFF636363),
            hoverColor: Colors.white,
            foregroundColor: Colors.white,
            focusColor: Colors.white,
            splashColor: Color(0x80FFFFFF),
            elevation: 0.5,
            tooltip: '',
            child: const Icon(Icons.add),
          ),
        ),
        body: routes.length==0?Container():

        ListView.builder(
          // shrinkWrap: true,
          controller:new ScrollController(),
          // primary: true,

          physics: ClampingScrollPhysics(),
            itemCount: routes.length,
            itemBuilder:(context, index) => HikePlanBlock(routesModel: RoutesModel(routes[index].id , routes[index].title.toString(), routes[index].info,),setRoutes: setRoutes,),
        )));
  }
}
