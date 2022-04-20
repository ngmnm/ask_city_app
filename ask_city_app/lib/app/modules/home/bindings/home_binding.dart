import 'package:hawary/app/features/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:hawary/app/features/profile/views/screens/profile_screen.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileScreen());
  }
}

