import 'package:ask_city_app/app/modules/auth/sign_up/controllers/registration_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
