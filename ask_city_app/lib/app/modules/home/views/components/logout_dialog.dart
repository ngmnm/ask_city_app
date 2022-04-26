part of home_view;

class _LogoutDialog extends StatelessWidget {
  const _LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Container(
              width: Get.width * 0.6,
              height: 200.0,
              padding: EdgeInsets.fromLTRB(36, 36, 36, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'هل تريد الخروج من التطبيق',
                    style: TextStyle(
                        color: Color(0xFF333030),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  CustomSubmitButton(
                    hint: "نعم",
                    action: () {
                      loginController.signout();
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 8),
                  CustomSubmitButton(
                    hint: "لا",
                    action: () {
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              )),
        ));
  }
}
