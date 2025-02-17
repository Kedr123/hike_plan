import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavPanelEditPlan extends StatefulWidget {
  const NavPanelEditPlan({super.key, required this.active_item, required this.isVisible});

  final int active_item;
  final bool isVisible;

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
                    if(widget.isVisible){
                      if (item == 0) {
                        Navigator.pushNamed(context, '/Index');
                      }
                      ;
                      if (item == 1) {
                        Navigator.pushNamed(context, '/HikePlans');
                      }
                      ;
                    }

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
                                  'lib/Assets/Images/Icons/home_icon.png')),
                        ),
                        label: "",
                        activeIcon: SizedBox(
                          height: 30,
                          width: 30,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/home_active_icon.png')),
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
                    BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/map_icon.png')),
                        ),
                        label: "",
                        activeIcon: SizedBox(
                          height: 30,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/map_active_icon.png')),
                        )),

                    BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/accaunt_icon.png')),
                        ),
                        label: "",
                        activeIcon: SizedBox(
                          height: 30,
                          child: Image(
                              image: AssetImage(
                                  'lib/Assets/Images/Icons/accaunt_active_icon.png')),
                        )),
                  ],
                ),
              ),
            )));
  }
}
