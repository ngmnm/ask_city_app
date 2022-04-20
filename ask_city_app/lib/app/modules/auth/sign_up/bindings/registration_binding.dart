
import 'package:hawary/app/features/otp/controllers/otp_controller.dart';
import 'package:hawary/app/features/registration/controllers/city_selection_controller.dart';
import 'package:hawary/app/features/registration/controllers/gender_selection_controller.dart';
import 'package:hawary/app/features/registration/controllers/registration_controller.dart';
import 'package:get/get.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => GenderSelectionController());
    Get.lazyPut(() => CitySelectionController());
    Get.lazyPut(() => OTPController());
  }
}

