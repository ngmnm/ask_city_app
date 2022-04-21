part of forget_password_view;

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      child: Column(
        children: [
          FaIcon(
            Icons.password_sharp,
            size: 58,
            color: Color(0xFFFFB300),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 36,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: Text(
                  'أدخل بريدك الإلكتروني وسنرسل لك رابطًا ',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ),
              Container(
                child: Text(
                  ' لإعادة تعيين كلمة المرور',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
