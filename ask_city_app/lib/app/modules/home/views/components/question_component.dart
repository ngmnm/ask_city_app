part of home_view;

class QuestionComponent extends StatelessWidget {
  String questionText;
  int answerCount;
  String categoryName;

  QuestionComponent(
      {Key? key,
      required this.questionText,
      required this.answerCount,
      required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.fromLTRB(11, 20, 11, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(11, 8, 11, 0),
            width: Get.width * 0.8,
            // color: Colors.white,
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
                        Icon(
                          FontAwesomeIcons.shareNodes,
                          color: Colors.black54,
                          size: 20,
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
                    Text(questionText),
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
      ),
    );
  }
}
