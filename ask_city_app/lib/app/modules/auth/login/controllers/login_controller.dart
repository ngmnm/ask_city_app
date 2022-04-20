import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawary/app/config/routes/app_pages.dart';
import 'package:hawary/app/features/registration/controllers/registration_controller.dart';
import 'package:hawary/app/utils/providers/users_provider.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  final isLoading = false.obs;
  var membership = [];

  FirebaseAuth _auth = FirebaseAuth.instance;
  void goToRegistrationScreen() {
    Get.offAllNamed(Routes.registration);
  }

  void goToOTPScreen() {
    Get.offNamed(Routes.otp);
  }

  void goToSettingScreen() {
    Get.offNamed(Routes.settings);
  }

  void goToprofileScreen() {
    Get.toNamed(Routes.notifications);
  }

  void goToForgetPasswordScreen() {
    Get.toNamed(Routes.forget_password);
  }

  void goToNewPasswordScreen() {
    Get.offNamed(Routes.new_password);
  }

  void goToHomeScreen() {
    Get.offNamed(Routes.home);
  }

  void goToDashboardScreen() {
    Get.offNamed(Routes.dashboard);
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    User? user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;

      goToDashboardScreen();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar(
          "فشل تسجيل الدخول",
          "No user found for that email",
          backgroundColor: Color(0xFFFFB500),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "فشل تسجيل الدخول",
          "wrong-password",
          backgroundColor: Color(0xFFFFB500),
          snackPosition: SnackPosition.BOTTOM,
        );
        print('Wrong password provided for that user.');
      } else {
        Get.snackbar(
          "فشل تسجيل الدخول",
          "Wrong password provided for that user",
          backgroundColor: Color(0xFFFFB500),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void toMembershipScreen() async {
    String? userId = getUserId();
    var userdata = await UserProvider().getUser(userId);
    membership = userdata["membership"];

    await Get.toNamed(Routes.membership_selection, arguments: membership);
  }

  String? getUserId() {
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    print(uid);

    var futureAccount = UserProvider().getUser(uid);
    print("future accoutn $futureAccount.toString()");
    return uid;
  }
  // String userId = Get.find<RegistrationController>().userId;

  // @override
  // void onInit() {
  //   super.onInit();
  //   UserProvider().getUser(userId).then((value) {
  //     change(value, status: RxStatus.success());
  //   }, onError: (error) {
  //     change(null, status: RxStatus.error(error.toString()));
  //   });
  // }
}
