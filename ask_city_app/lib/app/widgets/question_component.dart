import 'package:ask_city_app/app/routes/pages.dart';
import 'package:ask_city_app/app/widgets/share_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class QuestionComponent extends StatelessWidget {
  String questionText;
  int answerCount;
  String categoryName;
  String cityName;
  int questionId;

  QuestionComponent(
      {Key? key,
      required this.questionText,
      required this.answerCount,
      required this.categoryName,
      required this.cityName,
      required this.questionId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(11, 8, 11, 0),
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          width: Get.width * 0.8,
          height: Get.height * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textDirection: TextDirection.rtl,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#$categoryName",
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FontAwesomeIcons.circleExclamation,
                        color: Colors.black54,
                        size: 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ShareButtonComponent(
                        questionText: questionText,
                        cityName: cityName,
                        questionId: questionId,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '4 weeks ago',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.question);
                    },
                    child: Text(questionText),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    FontAwesomeIcons.solidBookmark,
                    color: Colors.black54,
                    size: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.solidMessage,
                        color: Colors.black54,
                        size: 20,
                      ),
                      Text(
                        '\t\t$answerCount',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Icon(
                    FontAwesomeIcons.retweet,
                    color: Colors.black54,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
