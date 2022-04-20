part of forget_password_view;

class _SendButton extends GetView<ForgetPasswordController> {
  const _SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFFFFB300)),
        child: TextButton(
          onPressed: () {
            controller.resetPassword(controller.email.text);
            // controller.goToLoginScreen();
          },
          child: Text(
            "تقديم",
            style: GoogleFonts.almarai(
                color: Color(0xFFFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
