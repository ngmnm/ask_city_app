// ignore_for_file: prefer_const_literals_to_create_immutables

library question_view;

import 'dart:ui';

import 'package:ask_city_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:share/share.dart';

import '../../controllers/question_controller.dart';
import '../components/select_category_card.dart';

part '../components/search_bar.dart';
part '../components/question_component.dart';
part '../components/share_button.dart';
part '../components/add_question_category_dialog.dart';

class QuestionScreen extends GetView<QuestionController> {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(homeController.category.value.toString()),
        backgroundColor: Color(0xFF864ADB),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(200),
                ],
                maxLines: 3,
                controller: controller.question,
                decoration: InputDecoration(
                    counterText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    labelText: "type your quesiton"),
              ),
              Text((200 - controller.charCount.value).toString() +
                  " character left"),
              Center(
                child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Ask Question",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
