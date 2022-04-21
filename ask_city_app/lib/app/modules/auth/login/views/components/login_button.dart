part of login_view;

class _LoginButton extends GetView<LoginController> {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFFFFB300)),
        child: TextButton(
          onPressed:
          (){},
          // controller.isLoading.value
          //     ? null
          //     : () => controller.login(
          //         context: context,
          //         password: controller.password.text,
          //         email: controller.email.text),
          child: controller.isLoading.value
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                )
              : Text(
                  "تسجيل دخول",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
