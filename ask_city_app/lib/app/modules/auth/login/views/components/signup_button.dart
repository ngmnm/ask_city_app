part of login_view;

class _SignUpButton extends GetView<LoginController> {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      //child: Text('Don\'t have an account? Create'),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "Don\'t have an account? "),
            TextSpan(
              text: 'Create',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  controller.goToRegistrationScreen();
                },
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
