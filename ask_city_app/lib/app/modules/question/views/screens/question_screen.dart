library question_view;

import 'dart:ui';
import 'package:ask_city_app/app/modules/home/controllers/home_controller.dart';
import 'package:ask_city_app/app/widgets/answer_widget.dart';
import 'package:ask_city_app/app/widgets/question_component.dart';
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
        title: Text("Question Page"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF864ADB),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            QuestionComponent(
                questionText: "test question for question page",
                answerCount: 3,
                categoryName: "other",
                cityName: "khobar",
                questionId: 1),
            SizedBox(
              width: Get.width * 0.8,
              child: Column(
                children: [
                  TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(200),
                    ],
                    maxLines: 3,
                    onChanged: (value) {
                      controller.charCount.value =
                          controller.answerQuestion.text.length;
                    },
                    controller: controller.answerQuestion,
                    decoration: InputDecoration(
                      hintText: "Write your answer here",
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text((200 - controller.charCount.value).toString() +
                              " character left"),
                          Spacer(),
                          SizedBox(
                            height: 12,
                          ),
                          Center(
                              child: IconButton(
                                  onPressed: () {
                                    controller.goToMain();
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: Color(0xFF864ADB),
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  AnswerWidget(
                    answerId: 1,
                    answerText: 'this is my answer',
                    cityName: 'khobar',
                    questionId: 1,
                    userFullName: 'Waleed Alfaifi',
                    voteCount: 5,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
