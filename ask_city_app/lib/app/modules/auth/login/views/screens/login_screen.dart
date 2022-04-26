library login_view;

import 'package:ask_city_app/app/modules/auth/login/controllers/login_controller.dart';
import 'package:ask_city_app/app/widgets/Custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/Theme_helpler.dart';
import '../../../../../widgets/header_widget.dart';

part '../components/login_button.dart';
part '../components/signup_button.dart';
part '../components/input_field.dart';
part '../components/forget_pass_text.dart';
part '../components/header.dart';

class LoginScreen extends GetView<LoginController> {
  double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(
                    20, 10, 20, 10), // This will be the login form
                child: Column(
                  children: [
                    Text(
                      "Login ",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Welcome to Ask City",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                      child: Column(
                        children: [
                          _InputField(),
                          SizedBox(height: 15.0),
                          _ForgetPassText(),
                          _LoginButton(),
                          _SignUpButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
