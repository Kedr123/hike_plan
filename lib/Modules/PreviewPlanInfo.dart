import 'package:flutter/material.dart';
import 'package:hike_plan/LocalDataBase/Controllers/RoutesController.dart';
import 'package:hike_plan/LocalDataBase/Database.dart';
import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:provider/provider.dart';

class PreviewPlanInfo extends StatefulWidget {
  const PreviewPlanInfo({super.key, required this.route, required this.setIndex});

  final RoutesModel route;
  final Function setIndex;

  @override
  State<PreviewPlanInfo> createState() => _PreviewPlanInfoState();
}

class _PreviewPlanInfoState extends State<PreviewPlanInfo> {
  void deletePlan() async {
    await RoutesController.delete(
        Provider.of<DBProvider>(context, listen: false).db,
        widget.route.id as int);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.route.getString());
    return Consumer<DBProvider>(
      builder: (context, value, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          backgroundColor: Color(0xFF4F4F4F),
          floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 85.0),
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: "FloatingActionButton1",
                    onPressed: () => {deletePlan()},
                    backgroundColor: Color(0xFF636363),
                    hoverColor: Colors.white,
                    foregroundColor: Colors.white,
                    focusColor: Colors.white,
                    splashColor: Color(0x80FFFFFF),
                    elevation: 0.5,
                    tooltip: '',
                    child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image(
                            image: AssetImage(
                                "lib/Assets/Images/Icons/delete_icon.png"))),
                  ),
                  FloatingActionButton(
                    heroTag: "FloatingActionButton2",
                    onPressed: () => {widget.setIndex(1)},
                    backgroundColor: Color(0xFF636363),
                    hoverColor: Colors.white,
                    foregroundColor: Colors.white,
                    focusColor: Colors.white,
                    splashColor: Color(0x80FFFFFF),
                    elevation: 0.5,
                    tooltip: '',
                    child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image(
                            image: AssetImage(
                                "lib/Assets/Images/Icons/edit_text_icon.png"))),
                  ),
                ],
              )),
          body: Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 3, 5),
                  width: double.maxFinite,
                  child: Text(
                    widget.route.title.toString(),
                    style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF)),
                    textAlign: TextAlign.justify,
                  ),
                ),
                AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    height: 570,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        width: double.maxFinite,
                        height: 500,
                        padding: EdgeInsets.fromLTRB(10, 5, 3, 5),
                        decoration: BoxDecoration(color: Color(0xFF4F4F4F)),
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 200),
                            child: Text(
                              widget.route.info.toString(),
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFFFFFFFF)),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ))),
              ]))),
    );
  }
}
