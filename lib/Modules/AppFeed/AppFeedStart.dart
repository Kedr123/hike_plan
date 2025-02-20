import 'package:flutter/material.dart';

class AppFeedStart extends StatefulWidget {
  const AppFeedStart({super.key});

  @override
  State<AppFeedStart> createState() => _AppFeedStartState();
}

class _AppFeedStartState extends State<AppFeedStart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 50, 15, 0),
        height: 180,
        // color: Colors.blue,
        child: Row(
          spacing: 15,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FractionallySizedBox(
            //   alignment: Alignment(context.size.width.sign, context.size.width.sign),
            //   widthFactor: 0.5,
            //   heightFactor: 1,
            //   child:
            Expanded(
              flex: 5,
              child: ElevatedButton(
                clipBehavior: Clip.hardEdge,
                style: ElevatedButton.styleFrom(
                  overlayColor: Colors.black,
                  visualDensity: VisualDensity(),
                  foregroundColor: Colors.black,
                  backgroundBuilder: (context, states, child) =>
                      // Image(fit: BoxFit.cover, image: AssetImage('lib/Assets/Images/Back/back_img_add_route_button.png')),
                      Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'lib/Assets/Images/Back/back_img_add_route_button_1024.png')),

                      child as Widget
                    ],
                  ),
                  elevation: 10,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onPressed: () => {},
                child: Image( width: 90, height: 90,image: AssetImage('lib/Assets/Images/Back/+.png')),
              ),
            ),
            Expanded(
                flex: 5,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    spacing: 15,
                    children: [
                      Expanded(
                          flex: 5,
                          child: Container(

                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 3,
                                  backgroundBuilder: (context, states, child) => Image( fit: BoxFit.fill, image: AssetImage('lib/Assets/Images/Back/back_img_track_button.png')),
                                  padding: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              onPressed: () => {},
                              child: null,
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(

                            width: double.infinity,
                            child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                    elevation: 3,
                                    backgroundBuilder: (context, states, child) => Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'lib/Assets/Images/Back/back_img_add_route_button.png')),
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                onPressed: () => {},
                                child: null,)
                          )),
                    ])),
            // )
          ],
        ));
  }
}
