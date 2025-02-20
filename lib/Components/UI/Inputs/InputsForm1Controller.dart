import 'package:flutter/material.dart';

class InputsForm1Controller extends StatefulWidget {
  const InputsForm1Controller(
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
  State<InputsForm1Controller> createState() => _InputsForm1ControllerState();
}

class _InputsForm1ControllerState extends State<InputsForm1Controller> {
  String stateValue = "";

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
            obscureText: widget.obscureText,
            enableSuggestions: widget.enableSuggestions,
            autocorrect: widget.autocorrect,
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
            controller: widget.controller,
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
