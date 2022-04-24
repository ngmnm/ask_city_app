import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class CustomSubmitButton extends StatelessWidget {
  CustomSubmitButton({
    required this.hint, required this.action,
  });

  final String hint;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: Get.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor),
        child: TextButton(
            onPressed: action,
            child: Text(
              hint,
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )));
  }
}
