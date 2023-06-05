import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final dynamic iconName;
  final dynamic suffixIcon;
  final dynamic suffixIcon2;
  final dynamic inputType;
  bool obscure = true;
  PasswordField(
      {super.key,
      required this.label,
      required this.iconName,
      required this.inputType,
      required this.suffixIcon,
      required this.obscure,
      required this.suffixIcon2});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  // String errorTextVal = '';
  // dynamic errorFunc(value) {
  //       setState(() {
  //         if(value.contains(' ')) {
  //           errorTextVal = "Please don't give space";
  //         } else {   
  //           errorTextVal = '';
  //         }
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onChanged: errorFunc,
      obscureText: widget.obscure,   
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
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.obscure = !widget.obscure;
              });
            },
              padding: const EdgeInsets.only(right: 15),
              icon: Icon(
                widget.obscure ?
                widget.suffixIcon : widget.suffixIcon2,
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
