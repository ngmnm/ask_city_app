// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hawary/app/utils/providers/post_user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:hawary/app/config/routes/app_pages.dart';
import 'package:hawary/app/utils/models/user.dart';
import 'package:hawary/app/utils/providers/users_provider.dart';
import 'package:hawary/app/utils/services/firebase_services.dart';
import 'package:hawary/app/utils/services/remote_services.dart';

class RegistrationController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String phoneNo, smsCode;
  String verificationId = '';
  bool codeSent = false;

  String userId = '';

  late User existingUser;

  String userName = "";
  String userEmail = "";
  String userMobile = "";
  String userAge = "";
  String userPass = "";
  String userRePass = "";
  String userCity = "";
  String userGender = "";

  final isLoading = false.obs;

  void signUpUser(String name, String email, String mobile, String pass,
      String age, String rePass, String city, String gender) {
    if (pass != rePass) {
      Get.snackbar(
        "فشل التسجيل",
        "كلمة المرور واعادة كلمة مختلفة",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else if (!isEmailValid(email)) {
      Get.snackbar(
        "فشل التسجيل",
        "البريد الالكتروني غير صالح",
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else {
      userName = name;
      userEmail = email;
      userMobile = mobile;
      userPass = pass;
      userGender = gender;
      userAge = age;
      userCity = city;

      createUser(userName, userEmail, userMobile, userAge, userPass, userRePass,
          userGender, userCity);
    }
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  void goToDashboard() {
    Get.offAllNamed(Routes.dashboard);
  }

  void goToMembershipSelection() {
    Get.offAllNamed(Routes.membership);
  }

  void goToLoginScreen() {
    Get.offNamed(Routes.login);
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();

  Future<Usermodel>? futureAccount;

  void postUser(Map<String, String> data) {
    // var futureAccount = PostUserProvider().crateUser();
    // print(futureAccount.toString());
  }

  String? getUserId() {
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    print(uid);

    var futureAccount = UserProvider().getUser(uid);
    return uid;
  }

  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    super.onReady();
    _firebaseUser = Rxn<User>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.authStateChanges());

    var user = UserProvider().getUser(getUserId()).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  // function to createuser, login and sign out user
  Future<dynamic> createUser(
      String username,
      String email,
      String mobile,
      String age,
      String password,
      String rePassword,
      String city,
      String gender) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final User user = _auth.currentUser!;
      user.getIdToken();
      final uid = user.uid;
      print(uid);
      Map<String, String> data = {
        "firebaseId": uid,
        "username": username,
        "password": password,
        "email": email,
        "phoneNumber": mobile,
        "gender": gender,
        "age": age,
        "city": city
      };

      userId = await UserProvider().crateUser(data);
      print('user id from reg method  $userId');

      // var userData =await  UserProvider().getUser(userId);

      goToMembershipSelection();
    } on FirebaseAuthException catch (e) {
      String message = e.message.toString();
      Get.snackbar(
        "Error creating Account",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFFFB500),
      );
    }
    return userId;
  }

  void signout() async {
    await _auth.signOut().then((value) => Get.offAllNamed(Routes.login));
  }

  // saveUser(Map data) async {
  //   try {
  //     UserProvider().saveUser(data).then((resp) {
  //       if (resp == "success") {
  //         clearTextEditingControllers();
  //         isLoading(false);
  //
  //         Get.snackbar("Add user", "User Added", backgroundColor: Colors.green);
  //       } else {
  //         Get.snackbar(
  //           "Add Task",
  //           "Failed to Add Task",
  //           backgroundColor: Color(0xFFFFB500),
  //         );
  //       }
  //     }, onError: (err) {
  //       isLoading(false);
  //       Get.snackbar(
  //         "Error creating Account",
  //         err.toString(),
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Color(0xFFFFB500),
  //       );
  //     });
  //   } catch (exception) {
  //     isLoading(false);
  //     Get.snackbar(
  //       "Error creating Account",
  //       exception.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Color(0xFFFFB500),
  //     );
  //   }
  // }

  void clearTextEditingControllers() {}

  void linkEmailPhone(String phoneNo) async {
    try {
      existingUser =
          FirebaseAuth.instance.currentUser!; //get currently logged in user

      //get the credentials of the new linking account

      final PhoneVerificationCompleted verified = (AuthCredential authResult) {
        signIn(authResult);
      };

      final PhoneVerificationFailed verificationfailed =
          (FirebaseAuthException authException) {
        print('${authException.message}');
      };
      _onCodeSent(String verificationId, int? forceResendingToken) {
        this.verificationId = verificationId;
        print(forceResendingToken);
        print("code sent");
      }

      final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
        this.verificationId = verId;
      };

      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNo,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verified,
          verificationFailed: verificationfailed,
          codeSent: _onCodeSent,
          codeAutoRetrievalTimeout: autoTimeout);

      Timer(Duration(seconds: 10), () {
        Get.offAllNamed(Routes.dashboard);
      });
    } catch (e) {
      print(e);
    }
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential pauthCreds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    signIn(pauthCreds);
  }

  signIn(AuthCredential pauthCreds) async {
    //now link these credentials with the existing user
    UserCredential linkauthresult =
        await existingUser.linkWithCredential(pauthCreds);
    print(linkauthresult.user?.email);
  }

  linkEmailGoogle() async {
    try {
      existingUser = FirebaseAuth.instance.currentUser!;
      print(existingUser.email);
      for (int i = 0; i < existingUser.providerData.length; i++) {
        print(existingUser.providerData[i].providerId);
      }

      //get the credentials of the new linking account
      final GoogleSignIn _googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential gcredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,

        idToken: googleAuth?.idToken,
      );

      //now link these credentials with the existing user
      UserCredential linkauthresult =
          await existingUser.linkWithCredential(gcredential);
      print(linkauthresult.user?.email);
      for (int i = 0; i < existingUser.providerData.length; i++) {
        print(existingUser.providerData[i].providerId);
      }
      Get.to(Routes.dashboard);
    } catch (e) {
      print(e);
    }
  }
}
