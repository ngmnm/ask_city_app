import 'package:ask_city_app/app/routes/pages.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final isLoading = false.obs;

  // FirebaseAuth _auth = FirebaseAuth.instance;
  void goToRegistrationScreen() {
    Get.offNamed(Routes.sign_up);
  }

  void goToLoginScreen() {
    Get.offNamed(Routes.login);
  }

  // void resetPassword(String email) async {
  //   await _auth.sendPasswordResetEmail(email: email).then((value) {
  //     Get.snackbar(
  //       "استعادة كلمة المرور",
  //       "قم بمراجعة البريد الالكتروني لاكمال بقية الخطوات ",
  //       backgroundColor: Color(0xFFFFB500),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     goToLoginScreen();
  //   }).catchError((onError) => Get.snackbar(
  //         "استعادة كلمة المرور",
  //         "البريد الالكتروني غير مسجل  ",
  //         backgroundColor: Color(0xFFFFB500),
  //         snackPosition: SnackPosition.BOTTOM,
  //       ));
  // }
}
