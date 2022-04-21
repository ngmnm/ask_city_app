import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.obscureText,
    this.onChange, required this.controller,
  });

  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool obscureText;
  Function(String value)? onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.75,
      child: TextFormField(
          onChanged: (value) => onChange!(value),
          textDirection: TextDirection.rtl,
          textCapitalization: TextCapitalization.words,
          keyboardType: inputType,
          controller: controller,
          style:  TextStyle(
            color: Color(0xFF000000),

          ),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.only(top: 12.0, right: 20.0),
              hintText: hint,
              hintStyle: TextStyle(fontSize: 15, color: Color(0xFFAAAAAA),fontWeight: FontWeight.w300,),
              hintTextDirection: TextDirection.rtl),
          obscureText: obscureText,
          textInputAction: inputAction),
    );
  }
}
