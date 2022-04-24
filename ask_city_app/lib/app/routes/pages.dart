import 'package:ask_city_app/app/modules/auth/forget_password/bindings/forget_password_binding.dart';
import 'package:ask_city_app/app/modules/auth/forget_password/views/screens/forget_password_screen.dart';
import 'package:ask_city_app/app/modules/auth/login/bindings/login_binding.dart';
import 'package:ask_city_app/app/modules/auth/login/views/screens/login_screen.dart';
import 'package:ask_city_app/app/modules/auth/sign_up/bindings/registration_binding.dart';
import 'package:ask_city_app/app/modules/auth/sign_up/views/screens/registration_screen.dart';
import 'package:ask_city_app/app/modules/home/bindings/home_binding.dart';
import 'package:ask_city_app/app/modules/home/views/screens/home_screen.dart';
import 'package:ask_city_app/app/modules/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../modules/ask_question/bindings/question_binding.dart';
import '../modules/ask_question/views/screens/question_screen.dart';


part 'routes.dart';

abstract class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.sign_up,
      page: () => SignUpScreen(),
      transition: Transition.cupertino,
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.forget_password,
      page: () => ForgetPasswordScreen(),
      transition: Transition.cupertino,
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeScreen(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ask_question,
      page: () => AskQuestionScreen(),
      transition: Transition.cupertino,
      binding: AskQuestionBinding(),
    ),
  ];
}
