library forget_password_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawary/app/constants/assets_constant.dart';
import 'package:hawary/app/features/forget_password/controllers/forget_password_controller.dart';
import 'package:get/get.dart';
import 'package:hawary/app/utils/widgets/custom_input_field.dart';

part '../components/send_button.dart';
part '../components/header.dart';
part '../components/input_field.dart';
part '../components/logo.dart';

class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20),
          ClipPath(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(alignment: Alignment.topLeft, child: BackButton()),
                  _HeaderLogo(),
                  Container(
                    height: Get.height * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(color: Color(0xFFFFB500), width: 2)),
                    //----------------------forget password form -------------------
                    child: Column(
                      children: [
                        _Header(),
                        SizedBox(
                          height: 15,
                        ),
                        //----------------------input fields-------------------
                        _InputField(),
                        SizedBox(height: 50),
                        _SendButton()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
