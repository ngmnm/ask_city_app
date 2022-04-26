import 'dart:ui';

import 'package:ask_city_app/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  var tabIndex = 0;

  void onItemTapped(int index) {
    tabIndex = index;
    update();
  }

  var category = "".obs;

  void goToQuestionPage() {
    Get.toNamed(Routes.ask_question, arguments: category.value);
  }

  void goToLoginPage() {
    Get.toNamed(Routes.login);
  }

}
