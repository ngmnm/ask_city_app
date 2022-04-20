part of login_view;

class _InputField extends GetView<LoginController> {
  const _InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldIcon(
          inputType: TextInputType.emailAddress,
          obscureText: false,
          icon: Icons.email,
          inputAction: TextInputAction.next,
          hint: 'البريد الإلكتروني',
          contoller: controller.email,
        ),
        SizedBox(height: 13),
        CustomTextFieldIcon(
          inputType: TextInputType.visiblePassword,
          obscureText: true,
          icon: Icons.password,
          inputAction: TextInputAction.go,
          hint: 'كلمة المرور',
          contoller: controller.password,
        ),
      ],
    );
  }
}
