part of login_view;

class _ForgetPassText extends GetView<LoginController> {
  const _ForgetPassText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          controller.goToForgetPasswordScreen();
        },
        child: Text(
          "Forgot your password?",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
