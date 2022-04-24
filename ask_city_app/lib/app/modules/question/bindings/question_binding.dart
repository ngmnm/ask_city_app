import 'package:ask_city_app/app/modules/question/controllers/question_controller.dart';
import 'package:get/get.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionController());
  }
}

