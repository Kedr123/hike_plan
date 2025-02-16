import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hike_plan/LocalDataBase/Database.dart';
import 'package:hike_plan/Models/AppFeed/AppFeed.dart';
import 'package:hike_plan/Models/NavigationPanel.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {


  @override
  Widget build(BuildContext context) {
    return Consumer<DBProvider>(builder: (context, value, child) => Scaffold(
        backgroundColor: Color(0xFF4F4F4F),
        bottomNavigationBar: NavigationPanel(active_item: 0),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: FloatingActionButton(
            onPressed: () => {
              // value.initDB(),
              value.comand()
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
      body: Container(
        child: AppFeed(),
    )
    ));
  }
}
