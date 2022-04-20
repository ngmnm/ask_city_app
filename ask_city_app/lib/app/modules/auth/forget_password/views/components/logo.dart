part of forget_password_view;

class _HeaderLogo extends StatelessWidget {
  const _HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
      child: SizedBox(
        width: Get.width * 0.2,
        height: Get.width * 0.2,
        child: SvgPicture.asset(
          ImageConstant.logo,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
