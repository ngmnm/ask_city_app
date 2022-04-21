library login_view;

import 'package:ask_city_app/app/modules/auth/login/controllers/login_controller.dart';
import 'package:ask_city_app/app/widgets/Custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

part '../components/login_button.dart';
part '../components/signup_button.dart';
part '../components/input_field.dart';
part '../components/forget_pass_text.dart';
part '../components/header.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //----------------------log picture -------------------

            SizedBox(height: 50),
            ClipPath(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(color: Color(0xFFFFB500), width: 2)),
                  child: Container(
                    padding: EdgeInsets.all(13),
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    height: Get.height * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _Header(),
                        SizedBox(height: 48),
                        _InputField(),
                        SizedBox(height: 5),
                        _ForgetPassText(),
                        SizedBox(height: 13),
                        _LoginButton(),
                        SizedBox(height: 33),
                        RaisedButton(
                          onPressed: () {},
                          child: Text(
                            "الدخول كزائر",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF20519A),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
