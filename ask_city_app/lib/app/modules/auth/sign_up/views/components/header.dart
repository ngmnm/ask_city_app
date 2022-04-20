part of register;

class _Header extends GetView<RegistrationController> {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.only(
            bottom: 4, // Space between underline and text
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black87,
            width: 2.0, // Underline thickness
          ))),
          child: Text(
            'التسجيل ',
            style:
                GoogleFonts.almarai(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () => controller.goToLoginScreen(),
          child: Container(
            padding: EdgeInsets.only(
              bottom: 4, // Space between underline and text
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Color(0xFFAAAAAA),
              width: 2.0,
              // Underline thickness
            ))),
            child: Text(
              'تسجيل الدخول',
              style: GoogleFonts.almarai(
                color: Color(0xFFAAAAAA),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
