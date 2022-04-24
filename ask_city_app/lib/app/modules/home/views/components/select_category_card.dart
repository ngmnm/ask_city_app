import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SelectCategoryCard extends StatelessWidget {
  SelectCategoryCard({
    required this.category,
    required this.action,
  });

  final String category;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0x7C493300).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ], borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
