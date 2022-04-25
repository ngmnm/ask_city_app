import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class ShareButtonComponent extends StatelessWidget {
  String questionText;
  int questionId;
  String cityName;

  ShareButtonComponent(
      {Key? key,
      required this.questionText,
      required this.cityName,
      required this.questionId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String questionForURL = questionText
            .toLowerCase()
            .replaceAll(RegExp(r"[\W\g]+"), ' ')
            .trim()
            .replaceAll(RegExp(r"[\W\g]+"), '-') +
        '-';
    cityName = cityName.toLowerCase();
    String shareURL = '$cityName/question/$questionForURL$questionId';
    final shareContent = Uri(
      scheme: 'https',
      host: 'askcity.co',
      path: shareURL,
    );
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.shareAlt,
              color: Color(0xFF474F59),
              // splashColor: Color(0xFF864ADB),
              size: 20,
            ),
            onPressed: () {
              Share.share(shareContent.toString());
            },
          ),
        ],
      ),
    );
  }
}
