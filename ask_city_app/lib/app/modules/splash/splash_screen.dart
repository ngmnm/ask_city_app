import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hawary/app/config/routes/app_pages.dart';
import 'package:hawary/app/constants/assets_constant.dart';
import 'package:hawary/app/utils/services/user_membership_get_storage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _initialize();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Get.width * 0.5,
          child: SvgPicture.asset(
            ImageConstant.logo,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  void _initialize() {
    Firebase.initializeApp().then((value) async {
      await Future.delayed(Duration(seconds: 1));
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offNamed(Routes.dashboard, arguments: box.read("membership"));
      } else {
        Get.offNamed(Routes.login);
      }
    });
  }
}
