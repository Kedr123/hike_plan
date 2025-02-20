import 'package:flutter/material.dart';
import 'package:hike_plan/Components/UI/Inputs/InputsForm1Controller.dart';
import 'package:hike_plan/Components/UI/Inputs/InputsMultiLineForm1Controller.dart';
import 'package:hike_plan/LocalDataBase/Controllers/RoutesController.dart';
import 'package:hike_plan/LocalDataBase/Database.dart';
import 'package:hike_plan/LocalDataBase/Models/RoutesModel.dart';
import 'package:provider/provider.dart';

class EditPlanInfoModule extends StatefulWidget {
  const EditPlanInfoModule(
      {super.key, required this.route, required this.setIndex, required this.upRoute});

  final RoutesModel route;
  final Function setIndex;
  final Function upRoute;



  @override
  State<EditPlanInfoModule> createState() => _EditPlanInfoModuleState();
}

class _EditPlanInfoModuleState extends State<EditPlanInfoModule> {
  void deletePlan() async {
    await RoutesController.delete(
        Provider.of<DBProvider>(context, listen: false).db,
        widget.route.id as int);
    Navigator.pop(context);
  }

  TextEditingController title = TextEditingController(text: "route");
  TextEditingController info = TextEditingController(text: "ttt");
  String title_error = "";

  void save() async {
    if (title.text.replaceAll(" ", "").isEmpty) {
      setState(() {
        title_error = "Данное поле должно быть заполнено";
      });
      return;
    }

    await RoutesController.update(Provider.of<DBProvider>(context, listen: false).db,
        new RoutesModel(widget.route.id, title.text, info.text));
    await widget.upRoute();
    widget.setIndex(0);
  }

  void cancel(){
    rewrite();
    widget.setIndex(0);
  }

  void init(){
    print("init");
    print(widget.route.getString());
    rewrite();
  }

  void rewrite(){
    setState(() {
      title.text = widget.route.title as String;
      info.text = widget.route.info==null?"":widget.route.info as String;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=> init());
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
                    onPressed: () => {save()},
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
                                "lib/Assets/Images/Icons/ok_green_icon.png"))),
                  ),
                  FloatingActionButton(
                    heroTag: "FloatingActionButton2",
                    onPressed: () => {cancel()},
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
                                "lib/Assets/Images/Icons/cancel_red_icon.png"))),
                  ),
                ],
              )),
          body: Container(
              margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(children: [
                InputsForm1Controller(
                    title: "title", controller: title, error: title_error),
                InputsMultiLineForm1Controller(
                    title: "title", controller: info, error: "")
              ]))),
    );
  }
}
