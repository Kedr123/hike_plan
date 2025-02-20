import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hike_plan/Pages/EditPlan.dart';
import 'package:hike_plan/Pages/EditPlanInfo.dart';

class NavPanelEditPlan extends StatefulWidget {
  const NavPanelEditPlan({super.key, required this.active_item, required this.isVisible, required this.setInstrument});

  final int active_item;
  final bool isVisible;
  final Function setInstrument;

  @override
  State<NavPanelEditPlan> createState() => _NavPanelEditPlanState();
}

class _NavPanelEditPlanState extends State<NavPanelEditPlan> {
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => SizedBox(
                child: Container(

              padding: EdgeInsets.all(20),
              // decoration: BoxDecoration(
              //   boxShadow: <BoxShadow>[
              //     BoxShadow(
              //         color: Colors.black54,
              //         blurRadius: 00.0,
              //         offset: Offset(0.0, 0.0))
              //   ],
              // ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  elevation: 0.0,
                  backgroundColor: Color(0xCB636363),
                  currentIndex: this.widget.active_item,
                  onTap: (item) {
                    // if(!widget.isMap) {
                    //   if (item == 0 || item == 1) {
                    //     Navigator.push(context, PageRouteBuilder(
                    //       pageBuilder: (context, animation,
                    //           secondaryAnimation) =>
                    //           EditPlan(route_id: widget.route_id as int,navPanelEditPlan_item: item,),));
                    //   }
                    // }
                    //
                    //   if (item == 2) {
                    //     Navigator.push(context,PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => EditPlanInfo(route_id: widget.route_id as int),) );
                    //     return;
                    //   }
                    //   if (item == 3) {
                    //     Navigator.pushNamed(context, '/HikePlans');
                    //     return;
                    //   }


                      widget.setInstrument(item);

                      // ;
                      // if (item == 1) {
                      //
                      //   // Navigator.pushNamed(context, '/HikePlans');
                      // }
                      // ;


                  },
                  items:!widget.isVisible?<BottomNavigationBarItem>[
                    BottomNavigationBarItem(icon: Container(), label: ""),
                    BottomNavigationBarItem(icon: Container(), label: ""),
                    BottomNavigationBarItem(icon: Container(), label: ""),
                    BottomNavigationBarItem(icon: Container(), label: ""),
                  ]: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/point_plus_icon.png')),
                        ),
                        label: "",
                        activeIcon: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/point_plus_active_icon.png')),
                        )),
                    BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/point_delete_icon.png')),
                        ),
                        label: "",
                        activeIcon: SizedBox(
                          height: 30,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/point_delete_active_icon.png')),
                        )),
                    BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/map_info_icon.png')),
                        ),
                        label: "",
                        activeIcon: SizedBox(
                          height: 30,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/map_info_active_icon.png')),
                        )),

                    BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/track_icon.png')),
                        ),
                        label: "",
                        activeIcon: SizedBox(
                          height: 30,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/track_active_icon.png')),
                        )),
                  ],
                ),
              ),
            )));
  }
}
