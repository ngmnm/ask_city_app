import 'package:ask_city_app/app/routes/pages.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _initialize();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Get.width * 0.5,
          child: const CircleAvatar(
            radius: 50,
            child: Text('logo'),
          ),
        ),
      ),
    );
  }

  void _initialize() async {
    await Future.delayed(Duration(seconds: 1));

    Get.offNamed(Routes.home);
  }
}
