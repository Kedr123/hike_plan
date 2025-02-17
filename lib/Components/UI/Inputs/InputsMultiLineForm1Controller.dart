import 'package:flutter/material.dart';

class InputsMultiLineForm1Controller extends StatefulWidget {
  const InputsMultiLineForm1Controller(
      {
        super.key,
        required this.title,
        required this.controller,
        required this.error,
        this.value,
        this.obscureText = false,
        this.enableSuggestions = true,
        this.autocorrect = true,
      });

  final String? title;
  final String? error;
  final String? value;
  final TextEditingController controller;

  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;

  @override
  State<InputsMultiLineForm1Controller> createState() => _InputsMultiLineForm1ControllerState();
}

class _InputsMultiLineForm1ControllerState extends State<InputsMultiLineForm1Controller> {
  String stateValue = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      // alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title.toString(),
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(
            height: 185,
            child: TextFormField(
              obscureText: widget.obscureText,
              enableSuggestions: widget.enableSuggestions,
              autocorrect: widget.autocorrect,
              initialValue: widget.value,
              controller: widget.controller,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.none
              ),
              cursorColor: Colors.white,
              maxLines: 100,
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
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
              child: Text(
                widget.error!=null?widget.error.toString():"",
                style: TextStyle(color: Color(0xFFEE5050)),
              ))
        ],
      ),
    );
  }
}
