part of login_view;

class _InputField extends GetView<LoginController> {
  const _InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: TextField(
            controller: controller.email,
            textInputAction: TextInputAction.next,
            decoration:
                ThemeHelper().textInputDecoration('Email', 'Enter your Email'),
          ),
          decoration: ThemeHelper().inputBoxDecorationShaddow(),
        ),
        SizedBox(height: 30.0),
        Container(
          alignment: Alignment.center,
          decoration: ThemeHelper().inputBoxDecorationShaddow(),
          child: TextField(
            controller: controller.password,
            obscureText: true,
            textInputAction: TextInputAction.go,
            decoration: ThemeHelper()
                .textInputDecoration('Password', 'Enter your password'),
          ),
        ),
      ],
    );
  }
}
