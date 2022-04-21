part of login_view;

class _Header extends GetView<LoginController> {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => controller.goToRegistrationScreen(),
          child: Container(
            padding: EdgeInsets.only(
              bottom: 4, // Space between underline and text
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Color(0xFFAAAAAA),
              width: 2.0, // Underline thickness
            ))),
            child: Text(
              'تسجيل ',
              style: TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: 4, // Space between underline and text
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black87,
            width: 2.0,
            // Underline thickness
          ))),
          child: Text(
            'تسجيل الدخول',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
