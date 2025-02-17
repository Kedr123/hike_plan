import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:server_monitor/ScrollHandler/FieldScrollHandler.dart';

class InputsMultiLineForm1 extends StatefulWidget {
  const InputsMultiLineForm1(
      {super.key, required this.title, required this.changeValue, required this.error,this.value});

  final String? title;
  final String? error;
  final String? value;
  final Function changeValue;

  @override
  State<InputsMultiLineForm1> createState() => _InputsMultiLineForm1State();
}

class _InputsMultiLineForm1State extends State<InputsMultiLineForm1> {
  String stateValue = "";
  final _keyMultipleText = GlobalKey<State<StatefulWidget>>();
  changeStateValue(value) {
    setState(() {
      stateValue = value;
    });
    widget.changeValue(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text(
              widget.title.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            // height: 185,
            child: TextFormField(
              key: _keyMultipleText,
              onTap: () {
                // FieldScrollHandler.ensureVisibleOnTextArea(textfieldKey: _keyMultipleText);
              },
              initialValue: widget.value,
              // maxLength: int,
              // maxLines: 3

              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.none
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.5,
                      )
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ))),
              maxLines: 11,
              onChanged: (value) => {changeStateValue(value)},
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
              child: Text(
                widget.error.toString(),
                style: TextStyle(color: Color(0xFFEE5050)),
              ))
        ],
      ),
    );
  }
}
//
// Future<void> ensureVisibleOnTextArea(
//     {required GlobalKey textfieldKey}) async {
//   final keyContext = textfieldKey.currentContext;
//   if (keyContext != null) {
//     await Future.delayed(const Duration(milliseconds: 500)).then(
//           (value) =>
//           Scrollable.ensureVisible(
//             keyContext,
//             duration: const Duration(milliseconds: 200),
//             curve: Curves.decelerate,
//           ),
//     );
//
//   }
// }