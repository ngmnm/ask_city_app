import 'dart:async';

import 'package:ask_city_app/app/routes/pages.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignUpController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String phoneNo, smsCode;
  String verificationId = '';
  bool codeSent = false;

  String userId = '';

  // late User existingUser;

  String userName = "";
  String userEmail = "";
  String userMobile = "";
  String userPass = "";
  String userRePass = "";

  final isLoading = false.obs;

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  void goToLoginScreen() {
    Get.offNamed(Routes.login);
  }

  void goToHomeScreen() {
    Get.offNamed(Routes.home);
  }
}
// FirebaseAuth _auth = FirebaseAuth.instance;

// Rxn<User> _firebaseUser = Rxn<User>();

// String? get user => _firebaseUser.value?.email;

// @override
// void onInit() {
//   super.onReady();
//   _firebaseUser = Rxn<User>(_auth.currentUser);
//   _firebaseUser.bindStream(_auth.authStateChanges());
// }

// Future<dynamic> createUser(
//   String username,
//   String email,
//   String mobile,
//   String password,
//   String rePassword,
// ) async {
//   try {
//     await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//
//     final User user = _auth.currentUser!;
//     user.getIdToken();
//     final uid = user.uid;
//     print(uid);
//     Map<String, String> data = {
//       "firebaseId": uid,
//       "username": username,
//       "password": password,
//       "email": email,
//       "phoneNumber": mobile,
//     };
//   } on FirebaseAuthException catch (e) {
//     String message = e.message.toString();
//     Get.snackbar(
//       "Error creating Account",
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Color(0xFFFFB500),
//     );
//   }
//   return userId;
// }

// void signout() async {
//   await _auth.signOut().then((value) => Get.offAllNamed(Routes.login));
// }

// linkEmailGoogle() async {
//   try {
//     existingUser = FirebaseAuth.instance.currentUser!;
//     print(existingUser.email);
//     for (int i = 0; i < existingUser.providerData.length; i++) {
//       print(existingUser.providerData[i].providerId);
//     }
//
//     //get the credentials of the new linking account
//     final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;
//
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//
//     //now link these credentials with the existing user
//     UserCredential linkauthresult =
//         await existingUser.linkWithCredential(credential);
//     print(linkauthresult.user?.email);
//     for (int i = 0; i < existingUser.providerData.length; i++) {
//       print(existingUser.providerData[i].providerId);
//     }
//     Get.to(Routes.home);
//   } catch (e) {
//     print(e);
//   }
// }
