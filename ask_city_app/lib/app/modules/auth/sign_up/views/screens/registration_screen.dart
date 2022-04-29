library sign_up;

import 'package:ask_city_app/app/modules/auth/sign_up/controllers/registration_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:get/get.dart';

import '../../../../../core/theme/Theme_helpler.dart';
import '../../../../../widgets/header_widget.dart';

part '../components/header.dart';
part '../components/input_field.dart';

class SignUpScreen extends GetView<SignUpController> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                      child: Column(children: [
                    GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 5, color: Colors.white),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(5, 5),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey.shade300,
                              size: 80.0,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.grey.shade700,
                              size: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Register",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      "Welcome to askcity",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        controller: controller.firstName,
                        textInputAction: TextInputAction.next,
                        decoration: ThemeHelper().textInputDecoration(
                            'First Name', 'Enter your first name'),
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                        controller: controller.lastName,
                        textInputAction: TextInputAction.next,
                        decoration: ThemeHelper().textInputDecoration(
                            'Last Name', 'Enter your last name'),
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: TextFormField(
                        controller: controller.email,
                        textInputAction: TextInputAction.next,
                        decoration: ThemeHelper().textInputDecoration(
                            "E-mail address", "Enter your email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (!(val!.isEmpty) &&
                              !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(val)) {
                            return "Enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: TextFormField(
                        controller: controller.password,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        decoration: ThemeHelper().textInputDecoration(
                            "Password*", "Enter your password"),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(height: 30.0),
                  ])),
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          'Sign Up'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        controller.createUser(
                            controller.firstName.text,
                            controller.lastName.text,
                            controller.email.text,
                            controller.password.text);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    //child: Text('Don\'t have an account? Create'),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "Already have an account? "),
                          TextSpan(
                            text: 'LogIn',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.goToLoginScreen();
                              },
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
