library register;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawary/app/features/otp/views/screens/otp_screen.dart';
import 'package:hawary/app/features/registration/controllers/city_selection_controller.dart';
import 'package:hawary/app/features/registration/controllers/gender_selection_controller.dart';
import 'package:hawary/app/features/registration/controllers/registration_controller.dart';
import 'package:get/get.dart';
import 'package:hawary/app/utils/models/user.dart';
import 'package:hawary/app/utils/providers/users_provider.dart';
import 'package:hawary/app/utils/widgets/custom_input_field.dart';
import 'package:hawary/app/utils/widgets/custom_submit_button.dart';
import 'package:hawary/app/utils/widgets/sign_in_via.dart';
import 'package:select_form_field/select_form_field.dart';

part '../components/header.dart';
part '../components/input_field.dart';
part '../components/dropdown_input.dart';
part '../components/gender.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  final _globalKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController membershipController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  RegistrationController registrationController =
      Get.put(RegistrationController());
  GenderSelectionController genderSelectionController = Get.find();
  CitySelectionController citySelectionController = Get.find();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(color: Color(0xFFFFB500), width: 2)),
                  //----------------------Sign up form -------------------
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _Header(),
                          SizedBox(height: 60),
                          CustomTextField(
                            inputType: TextInputType.emailAddress,
                            obscureText: false,
                            inputAction: TextInputAction.next,
                            hint: 'الاسم',
                            controller: nameController,
                          ),
                          SizedBox(height: 13),
                          CustomTextField(
                            inputType: TextInputType.emailAddress,
                            obscureText: false,
                            inputAction: TextInputAction.next,
                            hint: 'البريد الإلكتروني',
                            controller: emailController,
                          ),
                          SizedBox(height: 13),
                          CustomTextField(
                            inputType: TextInputType.phone,
                            obscureText: false,
                            inputAction: TextInputAction.next,
                            hint: 'رقم الجوال',
                            controller: mobileController,
                          ),
                          SizedBox(height: 13),
                          CustomTextField(
                            inputType: TextInputType.numberWithOptions(),
                            obscureText: false,
                            inputAction: TextInputAction.next,
                            hint: 'العمر',
                            controller: ageController,
                          ),
                          SizedBox(height: 13),
                          CustomTextField(
                            inputType: TextInputType.visiblePassword,
                            obscureText: true,
                            inputAction: TextInputAction.next,
                            hint: 'كلمة المرور',
                            controller: passController,
                          ),
                          SizedBox(height: 13),
                          CustomTextField(
                            inputType: TextInputType.emailAddress,
                            obscureText: true,
                            inputAction: TextInputAction.next,
                            hint: 'تاكيد كلمة المرور',
                            controller: confirmPassController,
                          ),
                          SizedBox(height: 13),
                          _DropDownField(),
                          _Gender(),
                          SizedBox(height: 13),
                          CustomSubmitButton(
                            label: 'التسجيل ',
                            onPressed: () {
                              signup();

                              // showDialog(
                              //     context: context,
                              //     builder: ((BuildContext context) {
                              //       return OTPScreen();
                              //     }));
                              // controller.codeSent
                              //     ? controller.signInWithOTP(controller.codeSent,
                              //         controller.verificationId)
                              //     : controller.linkEmailPhone(
                              //         controller.phoneNumber.text);
                            },
                          ),

                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: ((BuildContext context) {
                                    return OTPScreen();
                                  }));
                            },
                            child: Text("click here"),
                          ),
                          SizedBox(height: 33),
                          SignInVia(),
                          SizedBox(height: 50),
                        ],
                      ),
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

  void signup() {
    final _isValid = _globalKey.currentState!.validate();
    if (_isValid) {
      print(nameController.text);
      print(emailController.text);
      print(mobileController.text);
      print(ageController.text);
      print(passController.text);
      print(confirmPassController.text);

      print(genderSelectionController.selectedGender.value);
      print(citySelectionController.selectedCity.value);

      registrationController.createUser(
          nameController.text,
          emailController.text,
          mobileController.text,
          ageController.text,
          passController.text,
          confirmPassController.text,
          citySelectionController.selectedCity.value,
          genderSelectionController.selectedGender.value);
    } else {
      return null;
    }
  }
}
