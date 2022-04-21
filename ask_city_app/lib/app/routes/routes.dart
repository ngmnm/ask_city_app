part of 'pages.dart';

abstract class Routes {
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const sign_up = _Paths.sign_up;
  static const home = _Paths.home;
  static const forget_password = _Paths.forget_password;
}

abstract class _Paths {
  static const splash = '/splash/';
  static const login = '/login/';
  static const sign_up = '/sign_up/';
  static const home = '/home/';
  static const forget_password = '/forget_password/';
}
