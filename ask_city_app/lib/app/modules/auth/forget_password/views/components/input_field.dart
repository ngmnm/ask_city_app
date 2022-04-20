part of forget_password_view;

class _InputField extends GetView<ForgetPasswordController> {
  const _InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      inputType: TextInputType.emailAddress,
      obscureText: false,
      inputAction: TextInputAction.go,
      hint: 'ادخل بريدك الإلكتروني',
      controller: controller.email,
    );
  }
}
