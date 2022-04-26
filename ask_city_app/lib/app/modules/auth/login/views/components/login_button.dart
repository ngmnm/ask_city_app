part of login_view;

class _LoginButton extends GetView<LoginController> {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: ThemeHelper().buttonBoxDecoration(context),
        child: ElevatedButton(
          style: ThemeHelper().buttonStyle(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: controller.isLoading.value
                ? SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    'Sign In'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
          ),
          onPressed: controller.isLoading.value
              ? null
              : () => controller.login(
                  email: controller.email.text,
                  password: controller.password.text,
                  context: context),
        ),
      ),
    );
  }
}
