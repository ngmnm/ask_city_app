import 'package:hawary/app/features/login/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:hawary/app/features/registration/controllers/registration_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
