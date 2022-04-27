import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AnswerWidget extends StatelessWidget {
  String cityName;
  int questionId;
  String userFullName;
  String answerText;
  int answerId;
  int voteCount;

  AnswerWidget(
      {Key? key,
      required this.cityName,
      required this.questionId,
      required this.userFullName,
      required this.answerText,
      required this.answerId,
      required this.voteCount})
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
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(31, 161, 161, 161)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    userFullName,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  Text(
                    '\t\t - \t\t 4 weeks ago',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Row(
                children: [Text(answerText)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.black54,
                        size: 20,
                      ),
                      Text(
                        '$voteCount',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_downward,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ],
                  ),
                  Icon(
                    FontAwesomeIcons.circleExclamation,
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
