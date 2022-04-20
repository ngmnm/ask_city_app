part of login_view;

class _ForgetPassText extends GetView<LoginController> {
  const _ForgetPassText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.goToForgetPasswordScreen(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              "نسيت كلمة المرور؟",
              style: GoogleFonts.almarai(
                fontSize: 13,
                color: Color(0xFFAAAAAA),
              ),
            ),
          )
        ],
      ),
    );
  }
}
