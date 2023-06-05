import 'package:flutter/material.dart';

class NumberField extends StatefulWidget {
  final String label;
  final dynamic iconName;
  final dynamic inputType;
  NumberField(
      {super.key,
      required this.label,
      required this.iconName,
      required this.inputType,
});

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  // String errorTextVal = '';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onChanged: errorFunc,
      decoration: InputDecoration(
        // errorText: errorTextVal.isEmpty ? null: errorTextVal,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          // floatingLabelStyle: const TextStyle(color: Color.fromARGB(255, 179, 14, 11), fontSize: 18),
          floatingLabelStyle: const TextStyle(color: Color.fromARGB(255, 87, 2, 2), fontSize: 18),
          contentPadding: const EdgeInsets.all(13),
          // prefixIcon: Icon(iconName, size: 30,),
          prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Icon(
                widget.iconName,
                size: 30,
                color: const Color.fromARGB(183, 179, 14, 11),
              )),
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.black,),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color.fromARGB(255, 179, 14, 11))),
          filled: true,
          fillColor: Colors.grey[200]),
      keyboardType: widget.inputType,
    );
  }
}
