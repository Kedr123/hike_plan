import 'package:flutter/material.dart';
import 'package:hike_plan/Models/AppFeed/AppFeedStart.dart';

class AppFeed extends StatefulWidget {
  const AppFeed({super.key});

  @override
  State<AppFeed> createState() => _AppFeedState();
}

class _AppFeedState extends State<AppFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.topCenter,
      // color: Colors.red,

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,

        children: [
          AppFeedStart()
        ],
      ),
    );
  }
}
