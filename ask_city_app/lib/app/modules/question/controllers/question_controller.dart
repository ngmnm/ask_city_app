import 'package:ask_city_app/app/routes/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get/get.dart';

class QuestionController extends GetxController with StateMixin<List<dynamic>> {
  var category = Get.arguments;

  var charCount = 0.obs;
  TextEditingController question = TextEditingController();

  void goToMain() {
    Get.offAllNamed(Routes.home);
  }
}
