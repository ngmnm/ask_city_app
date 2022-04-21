library home_view;

import 'package:ask_city_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

part '../components/search_bar.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text("الرئيسية"),
          ),
          backgroundColor: Colors.black12),
      backgroundColor: Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 32, 16, 8),
          child: Column(
            children: [
              Text("dfgdf",
                  style: TextStyle(fontSize: 42, color: Colors.deepPurple)),
              Icon(FontAwesomeIcons.solidComment),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * 0.2,
                    height: Get.width * 0.2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x7C493300).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: Get.width * 0.4,
                    height: Get.width * 0.4,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x7C493300).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
