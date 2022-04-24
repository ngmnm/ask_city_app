part of question_view;

class _AskQuestionCategoryDialog extends GetView<HomeController> {
  const _AskQuestionCategoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Container(
              width: Get.width,
              height: 320.0,
              padding: EdgeInsets.fromLTRB(36, 36, 36, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Select a Category',
                    style: TextStyle(
                        color: Color(0xFF333030),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SelectCategoryCard(
                        action: () {},
                        category: 'coffee shops',
                      ),
                      SelectCategoryCard(
                        action: () {},
                        category: 'restaurants',
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SelectCategoryCard(
                        action: () {},
                        category: 'shops',
                      ),
                      SelectCategoryCard(
                        action: () {},
                        category: 'other',
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
