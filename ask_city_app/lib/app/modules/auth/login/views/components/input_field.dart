part of login_view;

class _InputField extends GetView<LoginController> {
  const _InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          inputType: TextInputType.emailAddress,
          obscureText: false,
          inputAction: TextInputAction.next,
          hint: 'البريد الإلكتروني',
          controller: controller.email,
        ),
        SizedBox(height: 13),
        CustomTextField(
          inputType: TextInputType.visiblePassword,
          obscureText: true,
          inputAction: TextInputAction.go,
          hint: 'كلمة المرور',
          controller: controller.password,
        ),
      ],
    );
  }
}
