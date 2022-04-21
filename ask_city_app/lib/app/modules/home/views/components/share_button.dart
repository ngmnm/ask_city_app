part of home_view;

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
    String shareContent =
        'https://askcity.co/$cityName/question/$questionForURL$questionId';
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
              Share.share(shareContent);
            },
          ),
        ],
      ),
    );
  }
}
