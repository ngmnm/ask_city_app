import 'package:ask_city_app/app/routes/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  final isLoading = false.obs;

  FirebaseAuth _auth = FirebaseAuth.instance;

  void goToRegistrationScreen() {
    Get.offAllNamed(Routes.sign_up);
  }

  void goToForgetPasswordScreen() {
    Get.toNamed(Routes.forget_password);
  }

  void goToHomeScreen() {
    Get.offNamed(Routes.home);
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    User? user;
    try {
      isLoading.value = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      isLoading.value = false;

      goToHomeScreen();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar(
          "فشل تسجيل الدخول",
          "No user found for that email",
          backgroundColor: Theme.of(context).primaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        isLoading.value = false;
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "فشل تسجيل الدخول",
          "wrong-password",
          backgroundColor: Theme.of(context).primaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        isLoading.value = false;
      } else {
        Get.snackbar(
          "فشل تسجيل الدخول",
          "Wrong password provided for that user",
          backgroundColor:Theme.of(context).primaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        isLoading.value = false;

      }
    }
  }
  void signout() async {
    await _auth.signOut().then((value) => Get.offAllNamed(Routes.login));
  }
}
