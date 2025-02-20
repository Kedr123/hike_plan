import 'package:flutter/material.dart';
import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:hike_plan/Modules/MapPreview.dart';
import 'package:hike_plan/Pages/EditPlan.dart';
import 'package:hike_plan/Pages/Plun.dart';

class HikePlanBlock extends StatefulWidget {
  const HikePlanBlock({super.key, required this.routesModel, required this.setRoutes});

  final RoutesModel routesModel;
  final Function setRoutes;

  @override
  State<HikePlanBlock> createState() => _HikePlanBlockState();
}

class _HikePlanBlockState extends State<HikePlanBlock> {
  int status = 0;

  void setStatus() {
    setState(() {
      status = status == 0 ? 1 : 0;
    });
  }

  int time_animation = 300;

  final ScrollController _scrollController = ScrollController();

  void pushEditPlan(){
    Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => Plun(route_id: widget.routesModel.id))).then((value)=>{
      widget.setRoutes()
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        height: status == 0 ? 225 : 485,
        duration: Duration(milliseconds: time_animation),
        child: Container(
            margin: EdgeInsets.fromLTRB(10, 25, 10, 0),
            decoration: BoxDecoration(
              color: Color(0xFF696969),
              borderRadius: BorderRadius.all((Radius.circular(10))),
              boxShadow: [
                BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 1),
              ],
            ),
            child: Column(
              spacing: 0,
              mainAxisSize: MainAxisSize.max,
              children: [
                AnimatedContainer(
                  height: status == 0 ? 125 : 75,
                  duration: Duration(milliseconds: time_animation),
                  child: ElevatedButton(
                    onPressed: () => setStatus(),
                    child: GestureDetector(
                      onTap: () => {
                        if (status == 1)
                          {setStatus()}
                        else
                          {pushEditPlan()}
                      },
                      child: Stack(
                        // width: double.maxFinite,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                                bottom: Radius.circular(0)),
                            child: MapPreview(),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0x00696969),
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                    bottom: Radius.circular(0)),

                                // boxShadow: [
                                //   BoxShadow(
                                //       color: Color(0x4C000000),
                                //       blurRadius: 4,
                                //       offset: Offset(0, 4),
                                //       spreadRadius: 1),
                                // ],
                              ),
                              child: AnimatedContainer(
                                color: Color(
                                    status == 0 ? 0x00696969 : 0x80696969),
                                duration:
                                    Duration(milliseconds: time_animation),
                                child: null,
                              )),
                        ],
                      ),
                    ),
                    //   decoration: BoxDecoration(
                    //     color: Colors.red,
                    //     borderRadius: BorderRadius.all((Radius.circular(10))),
                    // )),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        fixedSize: Size.fromWidth(double.maxFinite)),
                  ),
                ),
                AnimatedContainer(
                  height: status == 0 ? 75 : 385,
                  duration: Duration(milliseconds: time_animation),
                  child: ElevatedButton(
                      onPressed: () => setStatus(),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          backgroundColor: Color(0xFF696969),
                          fixedSize: Size.fromWidth(double.maxFinite),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(0),
                                  bottom: Radius.circular(10)))),
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 3, 5),
                          width: double.maxFinite,
                          child: Text(
                            widget.routesModel.title.toString(),
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFFFFFFFF)),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        AnimatedContainer(
                            duration: Duration(milliseconds: time_animation),
                            height: status == 0 ? 0 : (270),
                            child: Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                width: double.maxFinite,
                                height: status == 0 ? 0 : (270),
                                padding: EdgeInsets.fromLTRB(10, 5, 3, 5),
                                decoration:
                                    BoxDecoration(color: Color(0xFF696969)),
                                child: Scrollbar(
                                  controller: _scrollController,

                                  key: Key("Scroll" +
                                      widget.routesModel.id.toString()),
                                  // trackVisibility: true,
                                  thumbVisibility: true,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    // primary: true,
                                    controller: _scrollController,
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      widget.routesModel.info.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFFFFFFFF)),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ))),
                        AnimatedContainer(
                            duration: Duration(milliseconds: time_animation),
                            height: status == 0 ? 0 : (60),
                            child: Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                // spacing:180,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => {setStatus()},
                                    child: Text("Свернуть",
                                        style: TextStyle(
                                            color: Color(0xFFC36B6B))),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF4F4F4F),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFFC36B6B),
                                                width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => {pushEditPlan()},
                                    child: Text("Карта",
                                        style: TextStyle(
                                            color: Color(0xFF00A6FF))),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF4F4F4F),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xFF00A6FF),
                                                width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                  ),
                                ],
                              ),
                            ))
                      ])),
                ),
              ],
            )));
  }
}
