library question_view;

import 'dart:ui';
import 'package:ask_city_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_submit_button.dart';
import '../../controllers/question_controller.dart';

class QuestionScreen extends GetView<QuestionController> {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text("Ask Question in ${homeController.category.value.toString()}"),
        backgroundColor: Color(0xFF864ADB),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
          child: Column(
            children: [
              TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(200),
                ],
                maxLines: 3,
                onChanged: (value) {
                  controller.charCount.value = controller.question.text.length;
                },
                controller: controller.question,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    labelText: "type your quesiton"),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text((200 - controller.charCount.value).toString() +
                          " character left"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                  child: CustomSubmitButton(
                      action: () {
                        controller.goToMain();
                      },
                      hint: "Ask Question"))
            ],
          ),
        ),
      ),
    );
  }
}
