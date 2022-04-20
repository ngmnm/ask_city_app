part of login_view;

class _SignUpButton extends GetView<LoginController> {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          style: GoogleFonts.almarai(
            color: Color(0xFFAAAAAA),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
