import 'package:flutter/material.dart';


class InputsForm1 extends StatefulWidget {
  const InputsForm1(
      {super.key, required this.title, required this.changeValue, required this.error,this.value});

  final String? title;
  final String? error;
  final String? value;
  final Function changeValue;

  @override
  State<InputsForm1> createState() => _InputsForm1State();
}

class _InputsForm1State extends State<InputsForm1> {
  String stateValue = "";
  final _keyText = GlobalKey<State<StatefulWidget>>();

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
          Text(
            widget.title.toString(),
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          TextFormField(
            key: _keyText,
            onTap: () {
              // FieldScrollHandler.ensureVisibleOnTextArea(textfieldKey: _keyText);
            },
            initialValue: widget.value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              decoration: TextDecoration.none
            ),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.5,
                )
                ),
              focusColor: Colors.white,
            ),
            onChanged: (value) => {changeStateValue(value)},
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
//   }
// }
