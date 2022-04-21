part of home_view;

class _SearchBar extends GetView<HomeController> {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.black12),
            child: TextButton(
              onPressed: () {},
              child: Icon(Icons.search, size: 14, color: Color(0xFFF7F7F7)),
            ),
          ),
          Container(
            width: Get.width * 0.7,
            height: 45,
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: TextField(
                textDirection: TextDirection.rtl,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(
                  color: Color(0xFF000000),
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(right: 14.0, bottom: 5),
                    hintText: "بحث...",
                    hintStyle: TextStyle(
                      fontSize: 10,
                      color: Color(0xFFC0C0C0),
                      fontWeight: FontWeight.normal,
                    ),
                    hintTextDirection: TextDirection.rtl),
                textInputAction: TextInputAction.search),
          ),
        ],
      ),
    );
  }
}
