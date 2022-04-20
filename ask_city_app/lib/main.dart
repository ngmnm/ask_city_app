import 'package:ask_city_app/app/modules/home/views/screens/home_screen.dart';
import 'package:ask_city_app/app/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ColorScheme colorScheme = ColorScheme(
    primary: Color(0xFFFFFFFF), // <---- I set white color here
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFF1F519A),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xFF636363),
    surface: Color(0xFF808080),
    onBackground: Colors.white,
    error: Colors.redAccent,
    onError: Colors.redAccent,
    onPrimary: Colors.redAccent,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ask Cit App',
      getPages: AppPages.routes,
    );
  }
}
